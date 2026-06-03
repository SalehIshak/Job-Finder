class CreateJobEntity {
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

  const CreateJobEntity({
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
  });
}

// class GetJobsListEntityTest {
//   final String id;
//   final String title;
//   final String slug;
//   final String description;
//   final String location;
//   final String experience;
//   final String jobType;
//   final String jobLevel;
//   final String salaryRange;
//   final List<String> skills;
//   final List<String> responsibilities;
//   final List<String> requirements;
//   final List<String> benefits;
//   final String postedById;
//   final String? categoryId;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final bool isFavorite;
//   const GetJobsListEntityTest({
//     required this.id,
//     required this.title,
//     required this.slug,
//     required this.description,
//     required this.location,
//     required this.experience,
//     required this.jobType,
//     required this.jobLevel,
//     required this.salaryRange,
//     required this.skills,
//     required this.responsibilities,
//     required this.requirements,
//     required this.benefits,
//     required this.postedById,
//     this.categoryId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.isFavorite,
//   });
// }
