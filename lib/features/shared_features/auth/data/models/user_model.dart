import 'package:job_finder/features/shared_features/auth/domain/entitys/user_entity.dart';

class UserModel {
  final bool success;
  final String message;
  final UserDataModel data;

  UserModel({required this.success, required this.message, required this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(success: json["success"], message: json["message"], data: UserDataModel.fromJson(json["data"]));
  }
}

class UserDataModel {
  final String token;
  final String id;
  final String email;
  final String name;
  final bool isCompleted;

  UserDataModel({required this.token, required this.id, required this.email, required this.name, required this.isCompleted});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      token: json["token"],
      id: json["id"],
      email: json["email"],
      name: json["fullName"] ?? json["name"] ?? "",
      isCompleted: json["isCompleted"],
    );
  }

  UserEntity toEntity() {
    return UserEntity(token: token, id: id, email: email, name: name, isCompleted: isCompleted);
  }
}
