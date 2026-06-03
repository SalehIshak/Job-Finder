import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/errors/api_exceptions.dart';
import 'package:job_finder/core/errors/failur.dart';
import 'package:job_finder/features/recruiter/data/datasurse/recruiter_remote_datasurse.dart';
import 'package:job_finder/features/recruiter/domain/entitis/create_job_entity.dart';
import 'package:job_finder/features/recruiter/domain/repositories/recruiter_repository.dart';

@Injectable(as: RecruiterRepository)
class RecruiterRepositoryimp extends RecruiterRepository {
  final RecruiterRemoteDatasurse _recruiterRemoteDatasurse;
  RecruiterRepositoryimp(this._recruiterRemoteDatasurse);
  @override
  Future<Either<Failure, CreateJobEntity>> createJob(
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
      final response = await _recruiterRemoteDatasurse.createJob(
        title,
        description,
        location,
        experience,
        jobType,
        jobLevel,
        salaryRange,
        skills,
        responsibilities,
        requirements,
        benefits,
      );
      return Right(response.data.toEntity());
    } on ServerException catch (error) {
      return Left(Failure(error.apiErrorModel.errorMessage));
    }
  }

  // @override
  // Future<Either<Failure, List<GetJobsListEntityTest>>> getjobsList() async {
  //   try {
  //     final response = await _recruiterRemoteDatasurse.getJobs();

  //     return Right(response.data.map((job) => job.toEntityList()).toList());
  //   } on ServerException catch (error) {
  //     throw Left(Failure(error.apiErrorModel.errorMessage));
  //   }
  // }
}
