import 'package:job_finder/features/admin/domain/entitis/admi_update_job.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_get_jobs_list_entitys.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_statistics_entity.dart';
import 'package:job_finder/features/recruiter/domain/entitis/create_job_entity.dart';

class AdminState {}

class AdminInitaState extends AdminState {}

///////////////////////////////  NAVIGATON  //////////////////////////
class AdminNavigationState extends AdminState {
  final int currentIndex;
  AdminNavigationState({required this.currentIndex});
}

////////////////////////////////  INTERNAL METHODS  ////////////////////
class AdminJobTybeSellected extends AdminState {
  final String sellectedJobType;
  AdminJobTybeSellected({required this.sellectedJobType});
}

class AdminLevelSellected extends AdminState {
  final String sellectedLevel;
  AdminLevelSellected({required this.sellectedLevel});
}

class AdminSkilsListUpdate extends AdminState {}

///////////////////////////////  CREATE NEW JOB  //////////////////////////
class AdminCreateNewJobLoading extends AdminState {}

class AdminCreateNewJobSuccess extends AdminState {
  final CreateJobEntity jobs;
  AdminCreateNewJobSuccess({required this.jobs});
}

class AdminCreateNewJobFailuer extends AdminState {
  final String errorMessage;
  AdminCreateNewJobFailuer({required this.errorMessage});
}

///////////////////////////////  GET JOBS LIST //////////////////////////
class AdminGetJobsListLoading extends AdminState {}

class AdminGetJobsListSuccess extends AdminState {
  final List<AdminGetJobsListEntity> jobsList;
  AdminGetJobsListSuccess(this.jobsList);
}

class AdminGetJobsListFailuer extends AdminState {
  final String errorMessage;
  AdminGetJobsListFailuer(this.errorMessage);
}

///////////////////////////////  UPDATE JOBS  //////////////////////////
class AdminUpdatedJobLoading extends AdminState {}

class AdminUpdatedJobSuccess extends AdminState {
  final AdminUpdatedJobEntity jobsList;
  AdminUpdatedJobSuccess(this.jobsList);
}

class AdminUpdatedJobFailuer extends AdminState {
  final String errorMessage;
  AdminUpdatedJobFailuer(this.errorMessage);
}

///////////////////////////////   DELETE JOBS  //////////////////////////
class AdminDeleteJobLoading extends AdminState {
  final String jobId;
  AdminDeleteJobLoading({required this.jobId});
}

class AdminDeleteJobSuccess extends AdminState {
  final String deleteSuccefulyMessage; // TO MAKE LOADING WITH DELETED JOB ONLY
  AdminDeleteJobSuccess({required this.deleteSuccefulyMessage});
}

class AdminDeleteJobFailuer extends AdminState {
  final String errorMessage;
  AdminDeleteJobFailuer({required this.errorMessage});
}

///////////////////////////////   GET STATISTICS  //////////////////////////
class AdminGetStatisticsLoading extends AdminState {}

class AdminGetStatisticsSuccess extends AdminState {
  final List<AdminSuggestedJobsEntity> statisticsList;
  final AdminTotalJobsEntity totalJobs;
  AdminGetStatisticsSuccess({required this.statisticsList, required this.totalJobs});
}

class AdminGetStatisticsFailuer extends AdminState {
  final String errorMessage;
  AdminGetStatisticsFailuer({required this.errorMessage});
}
