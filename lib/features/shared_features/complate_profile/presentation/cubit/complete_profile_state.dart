import 'package:job_finder/features/shared_features/complate_profile/data/models/compleate_profile_model.dart';
import 'package:job_finder/features/shared_features/complate_profile/domain/entitys/country_entity.dart';
import 'package:job_finder/features/shared_features/complate_profile/domain/entitys/job_role_entity.dart';

abstract class CompleteProfileState {}

class ComlpeteProfileInitial extends CompleteProfileState {}

class CompleteProfileLoaded extends CompleteProfileState {
  final List<CountryEntity> countrys;
  final List<CountryEntity> counterysSellectedList;
  final List<JobRoleEntity> jobRoles;
  final List<JobRoleEntity> jobRolesSellectedList;
  final List<CompleateProfileModel> compleateProfileData;
  final String? profileImage;
  int currentScreen;

  CompleteProfileLoaded({
    required this.countrys,
    required this.counterysSellectedList,
    required this.jobRoles,
    required this.jobRolesSellectedList,
    required this.compleateProfileData,
    this.profileImage,
    required this.currentScreen,
  });
}

class CompleteProfileLoading extends CompleteProfileState {}
