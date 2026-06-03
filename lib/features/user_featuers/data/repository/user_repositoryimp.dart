import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/errors/api_exceptions.dart';
import 'package:job_finder/core/errors/failur.dart';
import 'package:job_finder/features/user_featuers/data/datasurse/user_remote_datasurse.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_entitys.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_get_all_jobs_entitys.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_suggested_entity.dart';
import 'package:job_finder/features/user_featuers/domain/repository/user_repsitory.dart';

@Injectable(as: UserRepsitory)
class UserRepositoryimp implements UserRepsitory {
  final UserRemoteDatasurse _userRemoteDatasurse;
  UserRepositoryimp(this._userRemoteDatasurse);

  // ============================================================
  // GET JOBS LIST
  // ============================================================
  @override
  Future<Either<Failure, List<GetJobsListEntity>>> getjobsList() async {
    try {
      final response = await _userRemoteDatasurse.getMyJobs();

      return Right(response.data.map((job) => job.toEntityList()).toList());
    } on ServerException catch (error) {
      throw Left(Failure(error.apiErrorModel.errorMessage));
    }
  }

  // ============================================================
  // GET SUGGESTED JOBS LIST
  // ============================================================
  @override
  Future<Either<Failure, UserStatisticsDataEntity>> getSuggestedJobs() async {
    try {
      final response = await _userRemoteDatasurse.getSuggestedJobs();
      return Right(response.toEntity().data);
    } on ServerException catch (error) {
      return Left(Failure(error.apiErrorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<UserJobDataEntity>>> getAllJobs({
    String? jobType,
    String? jobLevel,
    String? location,
    String? search,
  }) async {
    try {
      final Map<String, dynamic> params = {};

      if (jobType != null) params['jobType'] = jobType;
      if (jobLevel != null) params['jobLevel'] = jobLevel;
      if (location != null) params['location'] = location;
      if (search != null) params['search'] = search;

      final response = await _userRemoteDatasurse.getAllJobs(params);

      return Right(response.toEntity().jobs);
    } on ServerException catch (error) {
      return Left(Failure(error.apiErrorModel.errorMessage));
    }
  }
}
