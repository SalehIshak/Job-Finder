// ============================================================
// MODEL: AdminUpdateJobResponseModel
// ============================================================

import 'package:job_finder/features/admin/domain/entitis/admi_update_job.dart';

class AdminUpdatedJobResponseModel {
  final bool success;
  final String message;
  final AdminUpdatedJobDataModel data;

  AdminUpdatedJobResponseModel({required this.success, required this.message, required this.data});

  factory AdminUpdatedJobResponseModel.fromJson(Map<String, dynamic> json) {
    return AdminUpdatedJobResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: AdminUpdatedJobDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'data': data.toJson()};
  }
}

// ============================================================
// DATA MODEL: AdminUpdateJobDataModel
// ============================================================

class AdminUpdatedJobDataModel {
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

  AdminUpdatedJobDataModel({
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

  factory AdminUpdatedJobDataModel.fromJson(Map<String, dynamic> json) {
    return AdminUpdatedJobDataModel(
      id: json['id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      experience: json['experience'] as String,
      jobType: json['jobType'] as String,
      jobLevel: json['jobLevel'] as String,
      salaryRange: json['salaryRange'] as String,
      skills: List<String>.from(json['skills'] as List),
      responsibilities: List<String>.from(json['responsibilities'] as List),
      requirements: List<String>.from(json['requirements'] as List),
      benefits: List<String>.from(json['benefits'] as List),
      postedById: json['postedById'] as String,
      categoryId: json['categoryId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  // ============================================================
  // TO JSON : toJson
  // ============================================================

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'location': location,
      'experience': experience,
      'jobType': jobType,
      'jobLevel': jobLevel,
      'salaryRange': salaryRange,
      'skills': skills,
      'responsibilities': responsibilities,
      'requirements': requirements,
      'benefits': benefits,
      'postedById': postedById,
      'categoryId': categoryId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  // ============================================================
  // TO ENTITY : AdminUpdateJobEntity
  // ============================================================

  AdminUpdatedJobEntity toEntity() {
    return AdminUpdatedJobEntity(
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
      categoryId: categoryId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
