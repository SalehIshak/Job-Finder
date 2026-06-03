import 'package:job_finder/features/shared_features/auth/domain/entitys/get_profile_emtity.dart';
import 'package:job_finder/features/shared_features/auth/domain/entitys/user_entity.dart';

abstract class AuthState {}

// AUTH
class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity authUserData;

  AuthSuccess({required this.authUserData});
}

class GetProfileDataSuccess extends AuthState {
  final GetProfileEntity userProfileData;

  GetProfileDataSuccess({required this.userProfileData});
}

class AuthFailure extends AuthState {
  final String errorMAessage;
  AuthFailure({required this.errorMAessage});
}

class ReplaceProfileLoading extends AuthState {}

class ReplaceProfileDataSuccess extends AuthState {}

class AutoLoginFailure extends AuthState {
  final String errorMAessage;
  AutoLoginFailure({required this.errorMAessage});
}

class ProfileImageSuccess extends AuthState {
  String? profileImage;
  ProfileImageSuccess({required this.profileImage});
}

//LogOute
class LogOutLoading extends AuthState {}

class LogOuteSuccess extends AuthState {}

// OnBoarding
class OnBoardingSuccess extends AuthState {}

class OnBoardingFailed extends AuthState {}

// ComplateProfile
class ComplateProfileSuccess extends AuthState {}

class ComplateProfileFailed extends AuthState {}
