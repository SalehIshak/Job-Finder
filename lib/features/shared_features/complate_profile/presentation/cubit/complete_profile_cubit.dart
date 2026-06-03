import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/local/local_keys.dart';
import 'package:job_finder/core/local/pref_helper.dart';
import 'package:job_finder/features/shared_features/complate_profile/data/models/compleate_profile_model.dart';
import 'package:job_finder/features/shared_features/complate_profile/domain/entitys/country_entity.dart';
import 'package:job_finder/features/shared_features/complate_profile/domain/entitys/job_role_entity.dart';
import 'package:job_finder/features/shared_features/complate_profile/domain/usecases/complet_profile_usecases.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/cubit/complete_profile_state.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/widgets/coutrys_step.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/widgets/job_role_step.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/widgets/profile_pictuer_step.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  final GetCountrysUsecases getCountrysUsecases;
  final GetJobRolesUseCases getJobRolesUseCases;
  final PrefHelper prefHelper;
  CompleteProfileCubit(this.prefHelper, this.getCountrysUsecases, this.getJobRolesUseCases) : super(ComlpeteProfileInitial());

  int currentScreen = 0;
  late PageController pageController = PageController(initialPage: currentScreen);

  // TO SAVE ITEMS SELLECTED
  final List<CountryEntity> _counterysSellectedList = [];
  final List<JobRoleEntity> _jobRolesSellectedList = [];

  // TO PICK PICTUER

  List<CountryEntity> get counterysSellectedList => _counterysSellectedList;
  List<JobRoleEntity> get jobRolesSellectedList => _jobRolesSellectedList;

  List<CompleateProfileModel> compleateProfileDataList = [
    CompleateProfileModel(
      title: AppStrings.complateProfileTitle1,
      description: AppStrings.complateProfileDescription1,
      page: JobRoleStep(),
    ),
    CompleateProfileModel(
      title: AppStrings.complateProfileTitle2,
      description: AppStrings.complateProfileDescription2,
      page: CountrysStep(),
    ),
    CompleateProfileModel(
      title: AppStrings.complateProfileTitle3,
      description: AppStrings.complateProfileDescription3,
      page: ProfilePictuerStep(),
    ),
  ];

  // HELPER METHOD
  void _emitLoaded() {
    final currentState = state as CompleteProfileLoaded;
    emit(
      CompleteProfileLoaded(
        countrys: currentState.countrys,
        counterysSellectedList: List.from(_counterysSellectedList),
        jobRoles: currentState.jobRoles,
        jobRolesSellectedList: List.from(_jobRolesSellectedList),
        compleateProfileData: compleateProfileDataList,
        currentScreen: currentScreen,
        profileImage: prefHelper.getString(AppLocalKeys.profileImageAtSharedPrefs),
      ),
    );
  }

  void onPageChanged(int index) {
    currentScreen = index;
    _emitLoaded();
  }

  void nextPage() {
    if (currentScreen < compleateProfileDataList.length - 1) {
      currentScreen++;
      pageController.nextPage(duration: Duration(microseconds: 600), curve: Curves.bounceInOut);
    }
    _emitLoaded();
  }

  /* FIRST I CREATED TOW STATES METHODS , ONE FOR COUNTRYS LIST AND ONE FOR JOB ROLE LIST PUT THAT MAKE ISIUSE 
    THAT WHEN I CALL SECOND METOD IT DELETE STATES FOR FRIST METHOD SO I MAKED ONE STATE FOR TOW LISTS => CompleteProfile
*/

  // keep it like this bequse of this the frist method get data from surce
  Future<void> loadData() async {
    emit(CompleteProfileLoading());
    List<CountryEntity> countrys = await getCountrysUsecases.call();
    List<JobRoleEntity> jobRoles = await getJobRolesUseCases.call();
    final profileImageAtSharedPrefs = prefHelper.getString(AppLocalKeys.profileImageAtSharedPrefs);

    // step(2) to saved Sellected List dinamic
    // give sellected IDs From SaredPrefs
    final savedCountrysIds = prefHelper.getStringList(AppLocalKeys.profileImageAtSharedPrefs) ?? [];
    final savedJobRoleCodes = prefHelper.getStringList(AppLocalKeys.profileImageAtSharedPrefs) ?? [];

    // step(3) to saved Sellected List dinamic
    // Add All ItemSellected to Items Sellected Lists befor send it with state
    _counterysSellectedList.addAll(countrys.where((e) => savedCountrysIds.contains(e.code)));
    _jobRolesSellectedList.addAll(jobRoles.where((e) => savedJobRoleCodes.contains(e.id)));

    emit(
      CompleteProfileLoaded(
        currentScreen: currentScreen,
        compleateProfileData: compleateProfileDataList,
        countrys: countrys,
        counterysSellectedList: _counterysSellectedList,
        jobRoles: jobRoles,
        jobRolesSellectedList: _jobRolesSellectedList,
        profileImage: profileImageAtSharedPrefs,
      ),
    );
  }

  void onSellectedCountry(CountryEntity item) {
    if (_counterysSellectedList.contains(item)) {
      _counterysSellectedList.remove(item);
    } else {
      _counterysSellectedList.add(item);
    }

    // step(1) to saved Sellected List dinamic
    // made list of IDs from Sellected List
    final codesOfCountrys = _counterysSellectedList.map((e) => e.code).toList();
    // saved list of IDs in SaredPrefs
    prefHelper.setStringList(AppLocalKeys.profileImageAtSharedPrefs, codesOfCountrys);

    _emitLoaded();
  }

  void onSellectedJobRole(JobRoleEntity item) {
    if (_jobRolesSellectedList.contains(item)) {
      _jobRolesSellectedList.remove(item);
    } else {
      _jobRolesSellectedList.add(item);
    }
    // step(1) to saved Sellected List dinamic
    // made list of IDs from Sellected List
    final jobRolesIds = _jobRolesSellectedList.map((e) => e.id).toList();
    // saved list of IDs in SaredPrefs
    prefHelper.setStringList(AppLocalKeys.profileImageAtSharedPrefs, jobRolesIds);
    _emitLoaded();
  }

  void pickImageFromCamira() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      prefHelper.setString(AppLocalKeys.profileImageAtSharedPrefs, pickedImage.path);
      _emitLoaded();
    }
  }

  void pickImageFromGalary() async {
    final ImagePicker imagePicker = ImagePicker();
    final pikedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pikedImage != null) {
      prefHelper.setString(AppLocalKeys.profileImageAtSharedPrefs, pikedImage.path);

      _emitLoaded();
    }
  }

  void setComplateProfileStatuse(bool isComplateProfileDone) async {
    await prefHelper.setBool(AppLocalKeys.isComplateProfileDone, isComplateProfileDone);
  }

  bool? getComplateProfileStatuse() {
    return prefHelper.getBool(AppLocalKeys.isComplateProfileDone);
  }
}
