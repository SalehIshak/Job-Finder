import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/errors/failur.dart';
import 'package:job_finder/features/recruiter/domain/entitis/create_job_entity.dart';
import 'package:job_finder/features/recruiter/domain/repositories/recruiter_repository.dart';

@injectable
class CreateJobUseCase {
  final RecruiterRepository _recruiterRepository;
  CreateJobUseCase(this._recruiterRepository);
  Future<Either<Failure, CreateJobEntity>> call(
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
  ) {
    return _recruiterRepository.createJob(
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
  }
}

// @injectable
// class GetJobsListUseCaseTest {
//   final RecruiterRepository _recruiterRepository;
//   GetJobsListUseCaseTest(this._recruiterRepository);

//   Future<Either<Failure, List<GetJobsListEntityTest>>> call() {
//     return _recruiterRepository.getjobsList();
//   }
// }
