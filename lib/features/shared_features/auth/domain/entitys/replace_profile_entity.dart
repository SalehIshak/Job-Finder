// UPDATE PROFILE BY PUT METHOD
class ReplaceProfileEntity {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String address;
  final String gender;
  final List<String> jobRoles;
  final String role;
  final List<String> countries;
  final bool isCompleted;

  ReplaceProfileEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.jobRoles,
    required this.role,
    required this.countries,
    required this.isCompleted,
  });
}
