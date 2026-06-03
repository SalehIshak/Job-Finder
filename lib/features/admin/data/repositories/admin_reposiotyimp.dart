import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/errors/api_exceptions.dart';
import 'package:job_finder/core/errors/failur.dart';
import 'package:job_finder/features/admin/data/datasurse/admin_remote_datasurse.dart';
import 'package:job_finder/features/admin/domain/entitis/admi_update_job.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_delete_job_entiry.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_get_jobs_list_entitys.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_statistics_entity.dart';
import 'package:job_finder/features/admin/domain/repositories/admin_repository.dart';

@Injectable(as: AdminRepository)
class AdminReposiotyimp implements AdminRepository {
  final AdminRemoteDatasurse _adminRemoteDatasurse;
  AdminReposiotyimp(this._adminRemoteDatasurse);

  // ============================================================
  // GET JOBS LIST
  // ============================================================
  @override
  Future<Either<Failure, List<AdminGetJobsListEntity>>> getjobsList() async {
    try {
      final response = await _adminRemoteDatasurse.getJobs();
      return Right(response.data.map((job) => job.toEntityList()).toList());
    } on ServerException catch (error) {
      return Left(Failure(error.apiErrorModel.errorMessage));
    }
  }

  // ============================================================
  // UPDATE JOB
  // ============================================================
  @override
  Future<Either<Failure, AdminUpdatedJobEntity>> updateJob(String jobId, Map<String, dynamic> updatedFields) async {
    try {
      final response = await _adminRemoteDatasurse.updatejob(jobId, updatedFields);
      return Right(response.data.toEntity());
    } on ServerException catch (error) {
      return Left(Failure(error.apiErrorModel.errorMessage));
    }
  }

  // ============================================================
  // DELETE JOB
  // ============================================================
  @override
  Future<Either<Failure, AdminDeleteJobEntiry>> deleteJob(String jobId) async {
    try {
      final response = await _adminRemoteDatasurse.deleteJob(jobId);
      return Right(response.toEntity());
    } on ServerException catch (error) {
      return Left(Failure(error.apiErrorModel.errorMessage));
    }
  }

  // ============================================================
  // STATISTICS
  // ============================================================
  @override
  Future<Either<Failure, AdminStatisticsDataEntity>> getStatistics() async {
    try {
      final response = await _adminRemoteDatasurse.getPlatformStatuse();
      return Right(response.toEntity().data);
    } on ServerException catch (error) {
      return Left(Failure(error.apiErrorModel.errorMessage));
    }
  }
}
