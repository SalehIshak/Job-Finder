class GetProfileEntity {
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

  GetProfileEntity({
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
}
