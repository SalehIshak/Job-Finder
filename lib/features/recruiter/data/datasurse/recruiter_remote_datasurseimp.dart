import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/errors/api_exceptions.dart';
import 'package:job_finder/core/network/api_services.dart';
import 'package:job_finder/core/network/end_points.dart';
import 'package:job_finder/features/recruiter/data/datasurse/recruiter_remote_datasurse.dart';
import 'package:job_finder/features/recruiter/data/models/create_job_request_model.dart';

@Injectable(as: RecruiterRemoteDatasurse)
class RecruiterRemoteDatasurseimp extends RecruiterRemoteDatasurse {
  final ApiServices _apiServices;
  RecruiterRemoteDatasurseimp(this._apiServices);
  @override
  Future<CreateJobResponseModel> createJob(
    String title,
    String description,
    String location,
    String experience,
    String jobType,
    String jobLevel,
    String salaryRange,
    List<String> skills,
    List<String> responsibilities,
    List<String> requirements,
    List<String> benefits,
  ) async {
    try {
      final response = await _apiServices.post(AppEndPoints.jobCreate, {
        AppApiKeys.title: title,
        AppApiKeys.description: description,
        AppApiKeys.location: location,
        AppApiKeys.experience: experience,
        AppApiKeys.jobType: jobType,
        AppApiKeys.jobLevel: jobLevel,
        AppApiKeys.salaryRange: salaryRange,
        AppApiKeys.skills: skills,
        AppApiKeys.responsibilities: responsibilities,
        AppApiKeys.requirements: requirements,
        AppApiKeys.benefits: benefits,
      });

      return CreateJobResponseModel.fromJson(response);
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }

  // @override
  // Future<GetJobsListResponseModelTest> getJobs() async {
  //   try {
  //     final response = await _apiServices.get(AppEndPoints.jobs);
  //     return GetJobsListResponseModelTest.fromJson(response);
  //   } on DioException catch (error) {
  //     throw handelDioException(error);
  //   }
  // }
}
