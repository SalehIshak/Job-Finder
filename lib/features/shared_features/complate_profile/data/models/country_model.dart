import 'package:job_finder/features/shared_features/complate_profile/domain/entitys/country_entity.dart';

class CountryModel {
  final String name;
  final String code;

  CountryModel({required this.name, required this.code});
  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(name: json["name"], code: json["code"]);
  }
  CountryEntity toEntity() {
    return CountryEntity(name: name, code: code);
  }
}
