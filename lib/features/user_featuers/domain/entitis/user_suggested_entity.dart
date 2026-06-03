// ============================================================
// STATISTICS  ENTITY: UserStatisticsEntity
// ============================================================
class UserStatisticsEntity {
  final bool success;
  final String message;
  final UserStatisticsDataEntity data;
  final String timestamp;

  const UserStatisticsEntity({required this.success, required this.message, required this.data, required this.timestamp});
}

// ============================================================
// STATISTICS DATA  ENTITY: UserStatisticsDataEntity
// ============================================================
class UserStatisticsDataEntity {
  final UserTotalJobsEntity totalJobs;
  final List<UserSuggestedJobsEntity> suggestedJobs;

  const UserStatisticsDataEntity({required this.totalJobs, required this.suggestedJobs});
}

// ============================================================
// TOTAL JOBS  ENTITY: UserTotalJobsEntity
// ============================================================
class UserTotalJobsEntity {
  final int fullTime;
  final int partTime;
  final int freelance;

  const UserTotalJobsEntity({required this.fullTime, required this.partTime, required this.freelance});
  int get total => fullTime + partTime + freelance;
}

// ============================================================
// SUGGESTED JOBS  ENTITY: UserSuggestedJobsEntity
// ============================================================
class UserSuggestedJobsEntity {
  final String id;
  final String title;
  final UserCompanyEntity company;

  final String location;
  final String jobType;
  final String jobLevel;
  final String salaryRange;
  final DateTime createdAt;

  const UserSuggestedJobsEntity({
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
  factory UserSuggestedJobsEntity.empty() {
    return UserSuggestedJobsEntity(
      id: "",
      title: "",
      company: UserCompanyEntity(id: "", fullName: "", imageUrl: ""),
      location: "",
      jobType: "",
      jobLevel: "",
      salaryRange: "",
      createdAt: DateTime(0),
    );
  }
}

// ============================================================
// COMPANY  ENTITY: UserCompanyEntity
// ============================================================
class UserCompanyEntity {
  final String id;
  final String fullName;
  final String? imageUrl;

  const UserCompanyEntity({required this.id, required this.fullName, required this.imageUrl});
}
