import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/local/local_keys.dart';
import 'package:job_finder/core/local/pref_helper.dart';
import 'package:job_finder/features/shared_features/auth/domain/entitys/get_profile_emtity.dart';
import 'package:job_finder/features/shared_features/auth/domain/usecases/auth_usecases.dart';
import 'package:job_finder/features/shared_features/auth/presentation/cubit/auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _regesterUsecase;
  final GetProfileUseCase _getProfileUsecase;
  final ReplaceProfileUseCase _replaceProfileUsecase;
  final PrefHelper _prefHelper;

  AuthCubit(this._loginUseCase, this._regesterUsecase, this._getProfileUsecase, this._prefHelper, this._replaceProfileUsecase)
    : super(AuthInitial()) {
    loadProfileImage();
  }

  Future<void> logIn(String email, String password) async {
    emit(AuthLoading());
    final userData = await _loginUseCase.call(email, password);
    userData.fold(
      (failuer) {
        emit(AutoLoginFailure(errorMAessage: failuer.message));
      },
      (userEntity) {
        final token = userEntity.token;
        _prefHelper.setString(AppLocalKeys.tokenKey, token);
        // _prefHelper.saveToken(token: token);
        emit(AuthSuccess(authUserData: userEntity));
      },
    );
  }

  Future<void> regester(String email, String password, String name, String phoneNumber, String address) async {
    emit(AuthLoading());
    final userData = await _regesterUsecase.call(email, password, name, phoneNumber, address);
    userData.fold(
      (failure) {
        emit(AutoLoginFailure(errorMAessage: failure.message));
      },
      (userEntity) {
        final token = userEntity.token;
        _prefHelper.setString(AppLocalKeys.tokenKey, token);

        // _prefHelper.saveToken(token: token);
        emit(AuthSuccess(authUserData: userEntity));
      },
    );
  }

  GetProfileEntity? usrProfileEntity;
  Future<void> getProfileData() async {
    emit(AuthLoading());
    final token = _prefHelper.getString(AppLocalKeys.tokenKey);

    if (token == null || token == AppStrings.guest) return;

    final userProfileData = await _getProfileUsecase.call();

    userProfileData.fold(
      (failuer) {
        emit(AutoLoginFailure(errorMAessage: failuer.message));
      },
      (userProfileData) {
        usrProfileEntity = userProfileData;
        emit(GetProfileDataSuccess(userProfileData: userProfileData));
      },
    );
  }

  Future<void> autoLogin() async {
    final token = _prefHelper.getString(AppLocalKeys.tokenKey);
    final isOnboardingDone = _prefHelper.getBool(AppLocalKeys.isOnBoardingDone);
    final isComplateProfileDone = _prefHelper.getBool(AppLocalKeys.isComplateProfileDone);

    if (token == null || token.isEmpty) {
      // ✅ أولاً تحقق من الـ Onboarding
      if (isOnboardingDone != true) {
        emit(OnBoardingFailed());
        return;
      }

      // ✅ ثانياً تحقق من إكمال الـ Profile
      if (isComplateProfileDone != true) {
        emit(ComplateProfileFailed());
        return;
      }

      // ✅ أكمل الـ Onboarding والـ Profile لكن لا يوجد token → login
      emit(ComplateProfileSuccess());

      // if (isOnboardingDone == true) {
      //   emit(OnBoardingSuccess());
      // } else if (isOnboardingDone == false) {
      //   emit(OnBoardingFailed());
      // } else if (isComplateProfileDone == true) {
      //   emit(ComplateProfileSuccess());
      // } else if (isComplateProfileDone == false) {
      //   emit(ComplateProfileFailed());
      // }

      return;
    }

    final userProfileData = await _getProfileUsecase.call();
    userProfileData.fold(
      (failuer) {
        emit(AutoLoginFailure(errorMAessage: failuer.message));
      },
      (userProfileData) {
        usrProfileEntity = userProfileData;
        emit(GetProfileDataSuccess(userProfileData: userProfileData));
      },
    );
  }

  Future<void> logOut() async {
    emit(LogOutLoading());
    await Future.delayed(Duration(seconds: 3));
    _prefHelper.clearFromSharedPrefs(AppLocalKeys.tokenKey);
    emit(LogOuteSuccess());
  }

  Future<void> updateProfileData(String name, String phoneNumber, String address, String gender) async {
    emit(ReplaceProfileLoading());
    final response = await _replaceProfileUsecase.call(name, phoneNumber, address, gender);

    response.fold(
      (failuer) {
        emit(AuthFailure(errorMAessage: failuer.message));
      },
      (_) {
        getProfileData();
        emit(ReplaceProfileDataSuccess());
      },
    );
  }

  //  PROFILE IMAGE
  String? profileImage;
  void loadProfileImage() {
    final profileImage = _prefHelper.getString(AppLocalKeys.profileImageAtSharedPrefs);
    if (profileImage != null && profileImage.isNotEmpty) {
      this.profileImage = profileImage;
    }
  }

  void pickImageFromCamira() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      _prefHelper.setString(AppLocalKeys.profileImageAtSharedPrefs, pickedImage.path);
      profileImage = _prefHelper.getString(AppLocalKeys.profileImageAtSharedPrefs);
      emit(ProfileImageSuccess(profileImage: profileImage));
    }
  }

  void pickImageFromGalary() async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _prefHelper.setString(AppLocalKeys.profileImageAtSharedPrefs, pickedImage.path);
      profileImage = _prefHelper.getString(AppLocalKeys.profileImageAtSharedPrefs);

      emit(ProfileImageSuccess(profileImage: profileImage));
    }
  }
}
