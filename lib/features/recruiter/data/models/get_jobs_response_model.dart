// import 'package:job_finder/features/recruiter/domain/entitis/create_job_entity.dart';

// class GetJobsListResponseModelTest {
//   final bool success;
//   final List<GetJobsListDataModelTest> data;

//   GetJobsListResponseModelTest({required this.success, required this.data});

//   factory GetJobsListResponseModelTest.fromJson(Map<String, dynamic> json) {
//     return GetJobsListResponseModelTest(
//       success: json["success"],
//       data: (json["data"] as List<dynamic>).map((job) => GetJobsListDataModelTest.fromJson(job)).toList(),
//     );
//   }
// }

// class GetJobsListDataModelTest {
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

//   const GetJobsListDataModelTest({
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

//   factory GetJobsListDataModelTest.fromJson(Map<String, dynamic> json) {
//     return GetJobsListDataModelTest(
//       id: json['id'],
//       title: json['title'],
//       slug: json['slug'],
//       description: json['description'],
//       location: json['location'],
//       experience: json['experience'],
//       jobType: json['jobType'],
//       jobLevel: json['jobLevel'],
//       salaryRange: json['salaryRange'],
//       skills: List<String>.from(json['skills']),
//       responsibilities: List<String>.from(json['responsibilities']),
//       requirements: List<String>.from(json['requirements']),
//       benefits: List<String>.from(json['benefits']),
//       postedById: json['postedById'],
//       categoryId: json['categoryId'] ?? "",
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//       isFavorite: json["isFavorite"] ?? false,
//     );
//   }

//   GetJobsListEntityTest toEntityList() {
//     return GetJobsListEntityTest(
//       id: id,
//       title: title,
//       slug: slug,
//       description: description,
//       location: location,
//       experience: experience,
//       jobType: jobType,
//       jobLevel: jobLevel,
//       salaryRange: salaryRange,
//       skills: skills,
//       responsibilities: responsibilities,
//       requirements: requirements,
//       benefits: benefits,
//       postedById: postedById,
//       createdAt: createdAt,
//       updatedAt: updatedAt,
//       isFavorite: isFavorite,
//     );
//   }
// }
