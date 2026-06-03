import 'package:job_finder/features/user_featuers/domain/entitis/user_entitys.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_get_all_jobs_entitys.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_suggested_entity.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserItemSellected extends UserState {
  int currentItem;
  UserItemSellected({required this.currentItem});
}

///////////////////////////////   GET JOBS LIST  //////////////////////////

class UserGetJobsListLoading extends UserState {}

class UserGetJobsListSuccess extends UserState {
  final List<GetJobsListEntity> jobsList;
  UserGetJobsListSuccess(this.jobsList);
}

class UserGetJobsListFailuer extends UserState {
  final String errorMessage;
  UserGetJobsListFailuer(this.errorMessage);
}

///////////////////////////////   GET STATISTICS  //////////////////////////
class UserGetSuggestedJobsLoading extends UserState {}

class UserGetSuggestedJobsSuccess extends UserState {
  final List<UserSuggestedJobsEntity> statisticsList;
  UserGetSuggestedJobsSuccess({required this.statisticsList});
}

class UserGetSuggestedJobsFailuer extends UserState {
  final String errorMessage;
  UserGetSuggestedJobsFailuer({required this.errorMessage});
}

///////////////////////////////   GET ALL JOBS   //////////////////////////
class UserGetAllJobsLoading extends UserState {}

class UserGetAllJobsSuccess extends UserState {
  final List<UserJobDataEntity> alJobsList;
  UserGetAllJobsSuccess({required this.alJobsList});
}

class UserGetAllJobsFailuer extends UserState {
  final String errorMessage;
  UserGetAllJobsFailuer({required this.errorMessage});
}
