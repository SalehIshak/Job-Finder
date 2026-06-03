class JobRoleEntity {
  final String id;
  final String lable;

  JobRoleEntity({required this.id, required this.lable});
  factory JobRoleEntity.fromJson(Map<String, dynamic> json) {
    return JobRoleEntity(id: json["id"], lable: json["label"]);
  }
}
