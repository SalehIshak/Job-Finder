import 'package:job_finder/features/user_featuers/domain/entitis/user_suggested_entity.dart';

// ============================================================
// REQUEST MODEL: UserStatisticsRequestModel
// ============================================================
class UserStatisticsResponseModel {
  final bool success;
  final String message;
  final UserStatisticsDataModel data;
  final String timestamp;

  const UserStatisticsResponseModel({required this.success, required this.message, required this.data, required this.timestamp});

  factory UserStatisticsResponseModel.fromJson(Map<String, dynamic> json) {
    return UserStatisticsResponseModel(
      success: json["success"],
      message: json["message"],
      data: UserStatisticsDataModel.fromJson(json["data"]),
      timestamp: json["timestamp"],
    );
  }

  UserStatisticsEntity toEntity() {
    return UserStatisticsEntity(success: success, message: message, data: data.toEntity(), timestamp: timestamp);
  }
}

// ============================================================
// DATA MODEL: UserStatisticsDataModel
// ============================================================
class UserStatisticsDataModel {
  final UserTotalJobsModel totalJobs;
  final List<UserSuggestedJobsModel> suggestedJobs;

  const UserStatisticsDataModel({required this.totalJobs, required this.suggestedJobs});

  factory UserStatisticsDataModel.fromJson(Map<String, dynamic> json) {
    return UserStatisticsDataModel(
      totalJobs: UserTotalJobsModel.fromJson(json["totalJobs"]),
      suggestedJobs: (json["suggestedJobs"] as List).map((element) => UserSuggestedJobsModel.fromJson(element)).toList(),
    );
  }

  UserStatisticsDataEntity toEntity() {
    return UserStatisticsDataEntity(
      totalJobs: totalJobs.toEntity(),
      suggestedJobs: suggestedJobs.map((job) => job.toEntity()).toList(),
    );
  }
}

// ============================================================
// TOTAL JOBS MODEL: UserTotalJobsModel
// ============================================================

class UserTotalJobsModel {
  final int fullTime;
  final int partTime;
  final int freelance;

  const UserTotalJobsModel({required this.fullTime, required this.partTime, required this.freelance});

  factory UserTotalJobsModel.fromJson(Map<String, dynamic> json) {
    return UserTotalJobsModel(
      fullTime: json["fullTime"] as int,
      partTime: json["partTime"] as int,
      freelance: json["freelance"] as int,
    );
  }

  UserTotalJobsEntity toEntity() {
    return UserTotalJobsEntity(fullTime: fullTime, partTime: partTime, freelance: freelance);
  }
}

// ============================================================
// SUGGESTED JOBS MODEL: UserSuggestedJobsModel
// ============================================================
class UserSuggestedJobsModel {
  final String id;
  final String title;
  final UserCompanyJobModel company;
  final String location;
  final String jobType;
  final String jobLevel;
  final String salaryRange;
  final DateTime createdAt;

  const UserSuggestedJobsModel({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.jobType,
    required this.jobLevel,
    required this.salaryRange,
    required this.createdAt,
  });

  factory UserSuggestedJobsModel.fromJson(Map<String, dynamic> json) {
    return UserSuggestedJobsModel(
      id: json["id"],
      title: json["title"],
      company: UserCompanyJobModel.fromJson(json["company"]),
      location: json["location"],
      jobType: json["jobType"],
      jobLevel: json["jobLevel"],
      salaryRange: json["salaryRange"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }

  UserSuggestedJobsEntity toEntity() {
    return UserSuggestedJobsEntity(
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
// COUNTYR JOBS MODEL: UserCompanyJobModel
// ============================================================
class UserCompanyJobModel {
  final String id;
  final String fullName;
  final String? imageUrl;

  UserCompanyJobModel({required this.id, required this.fullName, required this.imageUrl});

  factory UserCompanyJobModel.fromJson(Map<String, dynamic> json) {
    return UserCompanyJobModel(id: json["id"], fullName: json["fullName"], imageUrl: json["imageUrl"] as String?);
  }

  UserCompanyEntity toEntity() {
    return UserCompanyEntity(id: id, fullName: fullName, imageUrl: imageUrl);
  }
}
