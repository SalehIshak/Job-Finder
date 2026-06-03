import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/errors/api_exceptions.dart';
import 'package:job_finder/core/network/api_services.dart';
import 'package:job_finder/core/network/end_points.dart';
import 'package:job_finder/features/admin/data/datasurse/admin_remote_datasurse.dart';
import 'package:job_finder/features/admin/data/models/admin_delete_job_model.dart';
import 'package:job_finder/features/admin/data/models/admin_get_jobs_model.dart';
import 'package:job_finder/features/admin/data/models/admin_statistics_requist_model.dart';
import 'package:job_finder/features/admin/data/models/admin_update_job_model.dart';

@Injectable(as: AdminRemoteDatasurse)
class AdminRemoteDatasurseimp implements AdminRemoteDatasurse {
  final ApiServices _apiServices;
  AdminRemoteDatasurseimp(this._apiServices);

  // ============================================================
  // GET JOBS LIST
  // ============================================================
  @override
  Future<AdminGetJobsListResponseModel> getJobs() async {
    try {
      final response = await _apiServices.get(AppEndPoints.jobs);
      return AdminGetJobsListResponseModel.fromJson(response);
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }

  // ============================================================
  // UPDATE JOB USING PATCH
  // ============================================================
  @override
  Future<AdminUpdatedJobResponseModel> updatejob(String jobId, Map<String, dynamic> updatedFields) async {
    try {
      final response = await _apiServices.patch(AppEndPoints.updateJobPatch(jobId), updatedFields);
      return AdminUpdatedJobResponseModel.fromJson(response);
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }

  // ============================================================
  // DELETE JOB
  // ============================================================
  @override
  Future<AdminDeleteJobResponseModel> deleteJob(String jobId) async {
    try {
      final response = await _apiServices.delete(jobId);
      return AdminDeleteJobResponseModel.fromJson(response);
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }

  // ============================================================
  // GET PLATFORM STATUS
  // ============================================================
  @override
  Future<AdminStatisticsResponseModel> getPlatformStatuse() async {
    try {
      final response = await _apiServices.get(AppEndPoints.getStatistics);
      return AdminStatisticsResponseModel.fromJson(response);
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }
}
