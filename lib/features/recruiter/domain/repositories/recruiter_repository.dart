import 'package:dartz/dartz.dart';
import 'package:job_finder/core/errors/failur.dart';
import 'package:job_finder/features/recruiter/domain/entitis/create_job_entity.dart';

abstract class RecruiterRepository {
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
  );

  // Future<Either<Failure, List<GetJobsListEntityTest>>> getjobsList();
}
