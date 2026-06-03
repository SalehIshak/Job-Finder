import 'package:job_finder/features/shared_features/complate_profile/domain/entitys/country_entity.dart';
import 'package:job_finder/features/shared_features/complate_profile/domain/entitys/job_role_entity.dart';

abstract class CompleteProfileRepository {
  Future<List<CountryEntity>> getCountrys();
  Future<List<JobRoleEntity>> getJopRole();
}
