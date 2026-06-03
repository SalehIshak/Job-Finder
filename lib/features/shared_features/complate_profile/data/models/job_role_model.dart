import 'package:job_finder/features/shared_features/complate_profile/domain/entitys/job_role_entity.dart';

class JobRoleModel {
  final String id;
  final String lable;

  JobRoleModel({required this.id, required this.lable});
  factory JobRoleModel.fromJson(Map<String, dynamic> json) {
    return JobRoleModel(id: json["id"], lable: json["label"]);
  }

  JobRoleEntity toEntity() {
    return JobRoleEntity(id: id, lable: lable);
  }
}
