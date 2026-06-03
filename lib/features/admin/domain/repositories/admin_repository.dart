import 'package:dartz/dartz.dart';
import 'package:job_finder/core/errors/failur.dart';
import 'package:job_finder/features/admin/domain/entitis/admi_update_job.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_delete_job_entiry.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_get_jobs_list_entitys.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_statistics_entity.dart';

abstract class AdminRepository {
  Future<Either<Failure, List<AdminGetJobsListEntity>>> getjobsList();
  Future<Either<Failure, AdminUpdatedJobEntity>> updateJob(String jobId, Map<String, dynamic> updatedFields);
  Future<Either<Failure, AdminDeleteJobEntiry>> deleteJob(String jobId);
  Future<Either<Failure, AdminStatisticsDataEntity>> getStatistics();
}
