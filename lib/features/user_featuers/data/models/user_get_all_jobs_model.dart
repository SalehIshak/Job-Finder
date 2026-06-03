import 'package:job_finder/features/user_featuers/domain/entitis/user_get_all_jobs_entitys.dart';

// ============================================================
// GET JOBS RESPONSE MODEL: GetAllJobsResponseModel
// ============================================================
class GetAllJobsResponseModel {
  final bool success;
  final List<UserJobModel> data;
  final UserPaginationModel pagination;

  const GetAllJobsResponseModel({required this.success, required this.data, required this.pagination});

  factory GetAllJobsResponseModel.fromJson(Map<String, dynamic> json) {
    return GetAllJobsResponseModel(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>).map((e) => UserJobModel.fromJson(e as Map<String, dynamic>)).toList(),
      pagination: UserPaginationModel.fromJson(json['pagination'] as Map<String, dynamic>),
    );
  }

  UserGetAllJobsEntity toEntity() =>
      UserGetAllJobsEntity(success: success, jobs: data.map((e) => e.toEntity()).toList(), pagination: pagination.toEntity());
}

// ============================================================
// JOB MODEL: JobModel
// ============================================================
class UserJobModel {
  final String id;
  final String title;
  final String experience;
  final String jobLevel;
  final String jobType;
  final String location;
  final String salaryRange;
  final String slug;
  final UserPostedByModel postedBy;
  final dynamic category;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isFavorite;

  const UserJobModel({
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

  factory UserJobModel.fromJson(Map<String, dynamic> json) {
    return UserJobModel(
      id: json['id'] as String,
      title: json['title'] as String,
      experience: json['experience'] as String,
      jobLevel: json['jobLevel'] as String,
      jobType: json['jobType'] as String,
      location: json['location'] as String,
      salaryRange: json['salaryRange'] as String,
      slug: json['slug'] as String,
      postedBy: UserPostedByModel.fromJson(json['postedBy'] as Map<String, dynamic>),
      category: json['category'] as dynamic,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      isFavorite: json['isFavorite'] as bool,
    );
  }

  UserJobDataEntity toEntity() => UserJobDataEntity(
    id: id,
    title: title,
    experience: experience,
    jobLevel: jobLevel,
    jobType: jobType,
    location: location,
    salaryRange: salaryRange,
    slug: slug,
    postedBy: postedBy.toEntity(),
    category: category,
    createdAt: createdAt,
    updatedAt: updatedAt,
    isFavorite: isFavorite,
  );
}

// ============================================================
// PSTED PY MODEL: PostedByModel
// ============================================================
class UserPostedByModel {
  final String id;
  final String fullName;
  final String email;
  final String? imageUrl;
  final String role;

  const UserPostedByModel({required this.id, required this.fullName, required this.email, this.imageUrl, required this.role});

  factory UserPostedByModel.fromJson(Map<String, dynamic> json) {
    return UserPostedByModel(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      imageUrl: json['imageUrl'] as String?,
      role: json['role'] as String,
    );
  }

  UserPostedByEntity toEntity() => UserPostedByEntity(id: id, fullName: fullName, email: email, imageUrl: imageUrl, role: role);
}

// ============================================================
// PAGINATION MODEL: PaginationModel
// ============================================================
class UserPaginationModel {
  final int maxCount;
  final int currentPage;
  final int totalPages;
  final bool hasNext;
  final bool hasPrevious;

  const UserPaginationModel({
    required this.maxCount,
    required this.currentPage,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrevious,
  });

  factory UserPaginationModel.fromJson(Map<String, dynamic> json) {
    return UserPaginationModel(
      maxCount: json['maxCount'] as int,
      currentPage: json['currentPage'] as int,
      totalPages: json['totalPages'] as int,
      hasNext: json['hasNext'] as bool,
      hasPrevious: json['hasPrevious'] as bool,
    );
  }

  UserPaginationEntity toEntity() => UserPaginationEntity(
    maxCount: maxCount,
    currentPage: currentPage,
    totalPages: totalPages,
    hasNext: hasNext,
    hasPrevious: hasPrevious,
  );
}
