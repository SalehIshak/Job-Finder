import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/errors/failur.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_entitys.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_get_all_jobs_entitys.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_suggested_entity.dart';
import 'package:job_finder/features/user_featuers/domain/repository/user_repsitory.dart';

// ============================================================
// GET JOBS LIST
// ============================================================
@injectable
class UserGetJobsListUseCase {
  final UserRepsitory _userRepository;
  UserGetJobsListUseCase(this._userRepository);
  Future<Either<Failure, List<GetJobsListEntity>>> call() {
    return _userRepository.getjobsList();
  }
}

// ============================================================
// GET SUGGESTED JOBS
// ============================================================
@injectable
class UserGetSuggestedListUseCase {
  final UserRepsitory _userRepository;
  UserGetSuggestedListUseCase(this._userRepository);
  Future<Either<Failure, UserStatisticsDataEntity>> call() {
    return _userRepository.getSuggestedJobs();
  }
}

// ============================================================
// GET ALL JOBS LIST
// ============================================================
@injectable
class UserGetAllJobsListUseCase {
  final UserRepsitory _userRepository;
  UserGetAllJobsListUseCase(this._userRepository);
  Future<Either<Failure, List<UserJobDataEntity>>> call({String? jobType, String? jobLevel, String? location, String? search}) {
    return _userRepository.getAllJobs(jobType: jobType, jobLevel: jobLevel, location: location, search: search);
  }
}
