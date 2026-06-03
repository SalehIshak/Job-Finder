import 'package:job_finder/features/admin/domain/entitis/admin_delete_job_entiry.dart';

class AdminDeleteJobResponseModel {
  final bool success;
  final String message;
  AdminDeleteJobResponseModel({required this.success, required this.message});

  factory AdminDeleteJobResponseModel.fromJson(Map<String, dynamic> json) {
    return AdminDeleteJobResponseModel(success: json["success"], message: json["message"]);
  }

  AdminDeleteJobEntiry toEntity() {
    return AdminDeleteJobEntiry(message: message, success: success);
  }
}
