import 'package:job_finder/features/shared_features/auth/domain/entitys/replace_profile_entity.dart';

class ReplaceProfileRequestModel {
  final bool success;
  final String message;
  final ReplaceProfileRequestData data;
  final String timestamp;

  ReplaceProfileRequestModel({required this.success, required this.message, required this.data, required this.timestamp});

  factory ReplaceProfileRequestModel.fromJson(Map<String, dynamic> json) {
    return ReplaceProfileRequestModel(
      success: json['success'],
      message: json['message'],
      data: ReplaceProfileRequestData.fromJson(json['data']),
      timestamp: json['timestamp'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {'success': success, 'message': message, 'data': data.toJson(), 'timestamp': timestamp};
  // }
}

class ReplaceProfileRequestData {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String address;
  final String gender;
  final List<String> jobRoles;
  final String role;
  final List<String> countries;
  final String? imageUrl;
  final bool isCompleted;

  ReplaceProfileRequestData({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.jobRoles,
    required this.role,
    required this.countries,
    this.imageUrl,
    required this.isCompleted,
  });

  factory ReplaceProfileRequestData.fromJson(Map<String, dynamic> json) {
    return ReplaceProfileRequestData(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      gender: json['gender'],
      jobRoles: List<String>.from(json['jobRoles'] ?? []),
      role: json['role'],
      countries: List<String>.from(json['countries'] ?? []),
      imageUrl: json['imageUrl'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'gender': gender,
      'jobRoles': jobRoles,
      'role': role,
      'countries': countries,
      'imageUrl': imageUrl,
      'isCompleted': isCompleted,
    };
  }

  ReplaceProfileEntity toEntity() {
    return ReplaceProfileEntity(
      id: id,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      gender: gender,
      jobRoles: jobRoles,
      role: role,
      countries: countries,
      isCompleted: isCompleted,
    );
  }
}
