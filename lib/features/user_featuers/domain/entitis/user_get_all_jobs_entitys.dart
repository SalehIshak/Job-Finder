// ============================================================
// GET ALL JOBS  ENTITY: GetAllJobsEntity
// ============================================================
class UserGetAllJobsEntity {
  final bool success;
  final List<UserJobDataEntity> jobs;
  final UserPaginationEntity pagination;

  const UserGetAllJobsEntity({required this.success, required this.jobs, required this.pagination});

  static UserGetAllJobsEntity get empty => UserGetAllJobsEntity(success: false, jobs: [], pagination: UserPaginationEntity.empty);
}

// ============================================================
// Job ENTITY: JobEntity
// ============================================================
class UserJobDataEntity {
  final String id;
  final String title;
  final String experience;
  final String jobLevel;
  final String jobType;
  final String location;
  final String salaryRange;
  final String slug;
  final UserPostedByEntity postedBy;
  final dynamic category;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isFavorite;

  const UserJobDataEntity({
    required this.id,
    required this.title,
    required this.experience,
    required this.jobLevel,
    required this.jobType,
    required this.location,
    required this.salaryRange,
    required this.slug,
    required this.postedBy,
    this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.isFavorite,
  });

  static UserJobDataEntity get empty => UserJobDataEntity(
    id: '',
    title: '',
    experience: '',
    jobLevel: '',
    jobType: '',
    location: '',
    salaryRange: '',
    slug: '',
    postedBy: UserPostedByEntity.empty,
    category: null,
    createdAt: DateTime(0),
    updatedAt: DateTime(0),
    isFavorite: false,
  );
}

// ============================================================
// PostedBy  ENTITY: PostedByEntity
// ============================================================
class UserPostedByEntity {
  final String id;
  final String fullName;
  final String email;
  final String? imageUrl;
  final String role;

  const UserPostedByEntity({required this.id, required this.fullName, required this.email, this.imageUrl, required this.role});

  static UserPostedByEntity get empty => UserPostedByEntity(id: '', fullName: '', email: '', imageUrl: null, role: '');
}

// ============================================================
// Pagination  ENTITY: PaginationEntity
// ============================================================
class UserPaginationEntity {
  final int maxCount;
  final int currentPage;
  final int totalPages;
  final bool hasNext;
  final bool hasPrevious;

  const UserPaginationEntity({
    required this.maxCount,
    required this.currentPage,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrevious,
  });

  static UserPaginationEntity get empty =>
      UserPaginationEntity(maxCount: 0, currentPage: 1, totalPages: 0, hasNext: false, hasPrevious: false);
}
