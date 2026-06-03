import 'package:job_finder/features/user_featuers/domain/entitis/user_entitys.dart';

class GetJobsListResponseModel {
  final bool success;
  final List<GetJobsListDataModel> data;

  GetJobsListResponseModel({required this.success, required this.data});

  factory GetJobsListResponseModel.fromJson(Map<String, dynamic> json) {
    return GetJobsListResponseModel(
      success: json["success"],
      data: (json["data"] as List<dynamic>).map((job) => GetJobsListDataModel.fromJson(job)).toList(),
    );
  }
}

class GetJobsListDataModel {
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

  const GetJobsListDataModel({
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

  factory GetJobsListDataModel.fromJson(Map<String, dynamic> json) {
    return GetJobsListDataModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      location: json['location'],
      experience: json['experience'],
      jobType: json['jobType'],
      jobLevel: json['jobLevel'],
      salaryRange: json['salaryRange'],
      skills: List<String>.from(json['skills']),
      responsibilities: List<String>.from(json['responsibilities']),
      requirements: List<String>.from(json['requirements']),
      benefits: List<String>.from(json['benefits']),
      postedById: json['postedById'],
      categoryId: json['categoryId'] ?? "",
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      isFavorite: json["isFavorite"] ?? false,
    );
  }

  GetJobsListEntity toEntityList() {
    return GetJobsListEntity(
      id: id,
      title: title,
      slug: slug,
      description: description,
      location: location,
      experience: experience,
      jobType: jobType,
      jobLevel: jobLevel,
      salaryRange: salaryRange,
      skills: skills,
      responsibilities: responsibilities,
      requirements: requirements,
      benefits: benefits,
      postedById: postedById,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isFavorite: isFavorite,
    );
  }
}
