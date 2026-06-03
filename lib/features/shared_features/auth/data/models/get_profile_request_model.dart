import 'package:job_finder/core/network/end_points.dart';
import 'package:job_finder/features/shared_features/auth/domain/entitys/get_profile_emtity.dart';

class GetProfileRequestModel {
  final bool success;
  final String message;
  final GetProfileData data;
  final String timestamp;

  GetProfileRequestModel({required this.success, required this.message, required this.data, required this.timestamp});

  factory GetProfileRequestModel.fromJson(Map<String, dynamic> json) {
    return GetProfileRequestModel(
      success: json[AppApiKeys.success],
      message: json[AppApiKeys.message],
      timestamp: json[AppApiKeys.timestamp],
      data: GetProfileData.fromJson(json[AppApiKeys.data]),
    );
  }
}

class GetProfileData {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String address;
  final String gender;
  final List jobRoles;
  final String role;
  final List countries;
  final String? imageUrl;
  final bool isCompleted;

  GetProfileData({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.jobRoles,
    required this.role,
    required this.countries,
    required this.imageUrl,
    required this.isCompleted,
  });

  factory GetProfileData.fromJson(Map<String, dynamic> json) {
    return GetProfileData(
      id: json[AppApiKeys.id],
      fullName: json[AppApiKeys.fullName],
      email: json[AppApiKeys.email],
      phoneNumber: json[AppApiKeys.phoneNumber],
      address: json[AppApiKeys.address],
      gender: json[AppApiKeys.gender],
      jobRoles: json[AppApiKeys.jobRoles],
      role: json[AppApiKeys.role],
      countries: json[AppApiKeys.countries],
      imageUrl: json[AppApiKeys.imageUrl],
      isCompleted: json[AppApiKeys.isCompleted],
    );
  }

  GetProfileEntity toEntity() {
    return GetProfileEntity(
      id: id,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      gender: gender,
      jobRoles: jobRoles,
      role: role,
      countries: countries,
      imageUrl: imageUrl,
      isCompleted: isCompleted,
    );
  }
}
