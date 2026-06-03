// ============================================================
// STATISTICS  ENTITY: AdminStatisticsEntity
// ============================================================
class UserStatisticsEntity {
  final bool success;
  final String message;
  final AdminStatisticsDataEntity data;
  final String timestamp;

  const UserStatisticsEntity({required this.success, required this.message, required this.data, required this.timestamp});
}

// ============================================================
// STATISTICS DATA  ENTITY: AdminStatisticsDataEntity
// ============================================================
class AdminStatisticsDataEntity {
  final AdminTotalJobsEntity totalJobs;
  final List<AdminSuggestedJobsEntity> suggestedJobs;

  const AdminStatisticsDataEntity({required this.totalJobs, required this.suggestedJobs});
}

// ============================================================
// TOTAL JOBS  ENTITY: AdminTotalJobsEntity
// ============================================================
class AdminTotalJobsEntity {
  final int fullTime;
  final int partTime;
  final int freelance;

  const AdminTotalJobsEntity({required this.fullTime, required this.partTime, required this.freelance});
  int get total => fullTime + partTime + freelance;
}

// ============================================================
// SUGGESTED JOBS  ENTITY: AdminSuggestedJobsEntity
// ============================================================
class AdminSuggestedJobsEntity {
  final String id;
  final String title;
  final AdminCompanyEntity company;
  final String location;
  final String jobType;
  final String jobLevel;
  final String salaryRange;
  final DateTime createdAt;

  const AdminSuggestedJobsEntity({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.jobType,
    required this.jobLevel,
    required this.salaryRange,
    required this.createdAt,
  });

  // ENTITY EMPTY : TO CREATE DUMMY LIST OR EMPTY LIS FOR SKELETONIZER WHEN LOADING
  factory AdminSuggestedJobsEntity.empty() {
    return AdminSuggestedJobsEntity(
      id: "",
      title: "",
      company: AdminCompanyEntity(id: "", fullName: "", imageUrl: ""),
      location: "",
      jobType: "",
      jobLevel: "",
      salaryRange: "",
      createdAt: DateTime(0),
    );
  }
}

// ============================================================
// COMPANY  ENTITY: AdminCompanyEntity
// ============================================================
class AdminCompanyEntity {
  final String id;
  final String fullName;
  final String? imageUrl;

  const AdminCompanyEntity({required this.id, required this.fullName, required this.imageUrl});
}
