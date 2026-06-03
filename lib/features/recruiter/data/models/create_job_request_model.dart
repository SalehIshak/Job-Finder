import 'package:job_finder/features/recruiter/domain/entitis/create_job_entity.dart';

class CreateJobResponseModel {
  final bool success;
  final String message;
  final CreateJobDataModel data;

  const CreateJobResponseModel({required this.success, required this.message, required this.data});

  factory CreateJobResponseModel.fromJson(Map<String, dynamic> json) {
    return CreateJobResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: CreateJobDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class CreateJobDataModel {
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

  const CreateJobDataModel({
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

  factory CreateJobDataModel.fromJson(Map<String, dynamic> json) {
    return CreateJobDataModel(
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
    );
  }

  CreateJobEntity toEntity() {
    return CreateJobEntity(
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
    );
  }
}
