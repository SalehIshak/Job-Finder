import 'package:job_finder/features/admin/domain/entitis/admin_statistics_entity.dart';

// ============================================================
// REQUEST MODEL: AdminStatisticsRequestModel
// ============================================================
class AdminStatisticsResponseModel {
  final bool success;
  final String message;
  final AdminStatisticsDataModel data;
  final String timestamp;

  const AdminStatisticsResponseModel({required this.success, required this.message, required this.data, required this.timestamp});

  factory AdminStatisticsResponseModel.fromJson(Map<String, dynamic> json) {
    return AdminStatisticsResponseModel(
      success: json["success"],
      message: json["message"],
      data: AdminStatisticsDataModel.fromJson(json["data"]),
      timestamp: json["timestamp"],
    );
  }

  UserStatisticsEntity toEntity() {
    return UserStatisticsEntity(success: success, message: message, data: data.toEntity(), timestamp: timestamp);
  }
}

// ============================================================
// DATA MODEL: AdminStatisticsDataModel
// ============================================================
class AdminStatisticsDataModel {
  final AdminTotalJobsModel totalJobs;
  final List<AdminSuggestedJobsModel> suggestedJobs;

  const AdminStatisticsDataModel({required this.totalJobs, required this.suggestedJobs});

  factory AdminStatisticsDataModel.fromJson(Map<String, dynamic> json) {
    return AdminStatisticsDataModel(
      totalJobs: AdminTotalJobsModel.fromJson(json["totalJobs"]),
      suggestedJobs: (json["suggestedJobs"] as List).map((element) => AdminSuggestedJobsModel.fromJson(element)).toList(),
    );
  }

  AdminStatisticsDataEntity toEntity() {
    return AdminStatisticsDataEntity(
      totalJobs: totalJobs.toEntity(),
      suggestedJobs: suggestedJobs.map((job) => job.toEntity()).toList(),
    );
  }
}

// ============================================================
// TOTAL JOBS MODEL: AdminTotalJobsModel
// ============================================================

class AdminTotalJobsModel {
  final int fullTime;
  final int partTime;
  final int freelance;

  const AdminTotalJobsModel({required this.fullTime, required this.partTime, required this.freelance});

  factory AdminTotalJobsModel.fromJson(Map<String, dynamic> json) {
    return AdminTotalJobsModel(
      fullTime: json["fullTime"] as int,
      partTime: json["partTime"] as int,
      freelance: json["freelance"] as int,
    );
  }

  AdminTotalJobsEntity toEntity() {
    return AdminTotalJobsEntity(fullTime: fullTime, partTime: partTime, freelance: freelance);
  }
}

// ============================================================
// SUGGESTED JOBS MODEL: AdminSuggestedJobsModel
// ============================================================
class AdminSuggestedJobsModel {
  final String id;
  final String title;
  final AdminCompanyJobModel company;
  final String location;
  final String jobType;
  final String jobLevel;
  final String salaryRange;
  final DateTime createdAt;

  const AdminSuggestedJobsModel({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.jobType,
    required this.jobLevel,
    required this.salaryRange,
    required this.createdAt,
  });

  factory AdminSuggestedJobsModel.fromJson(Map<String, dynamic> json) {
    return AdminSuggestedJobsModel(
      id: json["id"],
      title: json["title"],
      company: AdminCompanyJobModel.fromJson(json["company"]),
      location: json["location"],
      jobType: json["jobType"],
      jobLevel: json["jobLevel"],
      salaryRange: json["salaryRange"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }

  AdminSuggestedJobsEntity toEntity() {
    return AdminSuggestedJobsEntity(
      id: id,
      title: title,
      company: company.toEntity(),
      location: location,
      jobType: jobType,
      jobLevel: jobLevel,
      salaryRange: salaryRange,
      createdAt: createdAt,
    );
  }
}

// ============================================================
// COUNTYR JOBS MODEL: AdminCompanyJobModel
// ============================================================
class AdminCompanyJobModel {
  final String id;
  final String fullName;
  final String? imageUrl;

  AdminCompanyJobModel({required this.id, required this.fullName, required this.imageUrl});

  factory AdminCompanyJobModel.fromJson(Map<String, dynamic> json) {
    return AdminCompanyJobModel(id: json["id"], fullName: json["fullName"], imageUrl: json["imageUrl"] as String?);
  }

  AdminCompanyEntity toEntity() {
    return AdminCompanyEntity(id: id, fullName: fullName, imageUrl: imageUrl);
  }
}
