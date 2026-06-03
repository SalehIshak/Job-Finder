import 'package:job_finder/features/user_featuers/data/models/get_gobs_model.dart';
import 'package:job_finder/features/user_featuers/data/models/user_get_all_jobs_model.dart';
import 'package:job_finder/features/user_featuers/data/models/user_suggested_jobs_model.dart';

abstract class UserRemoteDatasurse {
  Future<GetJobsListResponseModel> getMyJobs();
  Future<UserStatisticsResponseModel> getSuggestedJobs();
  Future<GetAllJobsResponseModel> getAllJobs(Map<String, dynamic>? queryParams);
}
