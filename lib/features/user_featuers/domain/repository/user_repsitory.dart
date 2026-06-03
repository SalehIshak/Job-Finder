import 'package:dartz/dartz.dart';
import 'package:job_finder/core/errors/failur.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_entitys.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_get_all_jobs_entitys.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_suggested_entity.dart';

abstract class UserRepsitory {
  Future<Either<Failure, List<GetJobsListEntity>>> getjobsList();
  Future<Either<Failure, UserStatisticsDataEntity>> getSuggestedJobs();
  Future<Either<Failure, List<UserJobDataEntity>>> getAllJobs({
    String? jobType,
    String? jobLevel,
    String? location,
    String? search,
  });
}
