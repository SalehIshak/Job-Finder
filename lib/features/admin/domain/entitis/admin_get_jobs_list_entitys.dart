// ============================================================
// ADMIN ENTITY: TO CREATE COPY OF JOB
// ============================================================
class AdminGetJobsListEntity {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String location;
  final String experience;
  final String jobType;
  final String jobLevel;
  final String salaryRange;
  final List<String> skills;
  final List<String> responsibilities;
  final List<String> requirements;
  final List<String> benefits;
  final String postedById;
  final String? categoryId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isFavorite;
  const AdminGetJobsListEntity({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.location,
    required this.experience,
    required this.jobType,
    required this.jobLevel,
    required this.salaryRange,
    required this.skills,
    required this.responsibilities,
    required this.requirements,
    required this.benefits,
    required this.postedById,
    this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.isFavorite,
  });

  // ============================================================
  // ENTITY COPY WITH: TO CREATE COPY OF JOB AFTER EDDIT MOTHING
  // ============================================================
  AdminGetJobsListEntity copyWith({
    String? id,
    String? title,
    String? slug,
    String? description,
    String? location,
    String? experience,
    String? jobType,
    String? jobLevel,
    String? salaryRange,
    List<String>? skills,
    List<String>? responsibilities,
    List<String>? requirements,
    List<String>? benefits,
    String? postedById,
    String? categoryId,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isFavorite,
  }) {
    return AdminGetJobsListEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      location: location ?? this.location,
      experience: experience ?? this.experience,
      jobType: jobType ?? this.jobType,
      jobLevel: jobLevel ?? this.jobLevel,
      salaryRange: salaryRange ?? this.salaryRange,
      skills: skills ?? this.skills,
      responsibilities: responsibilities ?? this.responsibilities,
      requirements: requirements ?? this.requirements,
      benefits: benefits ?? this.benefits,
      postedById: postedById ?? this.postedById,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  // ============================================================
  // ENTITY EMPTY : TO CREATE DUMMY LIST OR EMPTY LIS FOR SKELETONIZER WHEN LOADING
  // ============================================================

  factory AdminGetJobsListEntity.empty() {
    return AdminGetJobsListEntity(
      id: '',
      title: '',
      slug: '',
      description: '',
      location: '',
      experience: '',
      jobType: '',
      jobLevel: '',
      salaryRange: '',
      skills: [],
      responsibilities: [],
      requirements: [],
      benefits: [],
      postedById: '',
      categoryId: null,
      createdAt: DateTime(0),
      updatedAt: DateTime(0),
      isFavorite: false,
    );
  }
}
