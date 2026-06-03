import 'package:job_finder/features/admin/data/models/admin_delete_job_model.dart';
import 'package:job_finder/features/admin/data/models/admin_get_jobs_model.dart';
import 'package:job_finder/features/admin/data/models/admin_statistics_requist_model.dart';
import 'package:job_finder/features/admin/data/models/admin_update_job_model.dart';

abstract class AdminRemoteDatasurse {
  Future<AdminGetJobsListResponseModel> getJobs();
  Future<AdminUpdatedJobResponseModel> updatejob(String jobId, Map<String, dynamic> updatedFields);
  Future<AdminDeleteJobResponseModel> deleteJob(String jobId);
  Future<AdminStatisticsResponseModel> getPlatformStatuse();
}
