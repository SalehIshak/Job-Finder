import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/errors/failur.dart';
import 'package:job_finder/features/admin/domain/entitis/admi_update_job.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_delete_job_entiry.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_get_jobs_list_entitys.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_statistics_entity.dart';
import 'package:job_finder/features/admin/domain/repositories/admin_repository.dart';

// ============================================================
//  GET JOB
// ============================================================
@injectable
class AdminGetJobsListUseCase {
  final AdminRepository _adminRepository;
  AdminGetJobsListUseCase(this._adminRepository);

  Future<Either<Failure, List<AdminGetJobsListEntity>>> call() {
    return _adminRepository.getjobsList();
  }
}

// ============================================================
// UPDATE JOB
// ============================================================
@injectable
class AdminUpdateJobUseCase {
  final AdminRepository _adminRepository;
  AdminUpdateJobUseCase(this._adminRepository);
  Future<Either<Failure, AdminUpdatedJobEntity>> call(String jobId, Map<String, dynamic> updatedFields) {
    return _adminRepository.updateJob(jobId, updatedFields);
  }
}

// ============================================================
// DELETE JOB
// ============================================================
@injectable
class AdminDeleteJobUsecases {
  final AdminRepository _adminRepository;
  AdminDeleteJobUsecases(this._adminRepository);

  Future<Either<Failure, AdminDeleteJobEntiry>> call(String jobId) {
    return _adminRepository.deleteJob(jobId);
  }
}

// ============================================================
// GET STATISTICS
// ============================================================
@injectable
class AdminGetStatisticsUsecases {
  final AdminRepository _adminRepository;
  AdminGetStatisticsUsecases(this._adminRepository);

  Future<Either<Failure, AdminStatisticsDataEntity>> call() {
    return _adminRepository.getStatistics();
  }
}
