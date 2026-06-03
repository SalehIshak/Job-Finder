import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/errors/api_exceptions.dart';
import 'package:job_finder/core/network/api_services.dart';
import 'package:job_finder/core/network/end_points.dart';
import 'package:job_finder/features/user_featuers/data/datasurse/user_remote_datasurse.dart';
import 'package:job_finder/features/user_featuers/data/models/get_gobs_model.dart';
import 'package:job_finder/features/user_featuers/data/models/user_get_all_jobs_model.dart';
import 'package:job_finder/features/user_featuers/data/models/user_suggested_jobs_model.dart';

@Injectable(as: UserRemoteDatasurse)
class UserRemoteDatasurseImp implements UserRemoteDatasurse {
  final ApiServices _apiServices;
  UserRemoteDatasurseImp(this._apiServices);

  // ============================================================
  // GET MY JOBS LIST
  // ============================================================
  @override
  Future<GetJobsListResponseModel> getMyJobs() async {
    try {
      final response = await _apiServices.get(AppEndPoints.jobs);
      return GetJobsListResponseModel.fromJson(response);
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }

  // ============================================================
  // GET SUGGESTED JOBS LIST
  // ============================================================
  @override
  Future<UserStatisticsResponseModel> getSuggestedJobs() async {
    try {
      final response = await _apiServices.get(AppEndPoints.getStatistics);
      return UserStatisticsResponseModel.fromJson(response);
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }

  // ============================================================
  // GET ALL JOBS LIST
  // ============================================================
  @override
  Future<GetAllJobsResponseModel> getAllJobs(Map<String, dynamic>? queryParams) async {
    try {
      final response = await _apiServices.get(AppEndPoints.getAllJobs, queryParams: queryParams);
      return GetAllJobsResponseModel.fromJson(response);
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }
}
