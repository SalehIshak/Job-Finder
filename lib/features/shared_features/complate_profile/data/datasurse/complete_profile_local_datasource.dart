import 'package:job_finder/features/shared_features/complate_profile/data/models/country_model.dart';
import 'package:job_finder/features/shared_features/complate_profile/data/models/job_role_model.dart';

abstract class CompleteProfileLocalDatasource {
  Future<List<CountryModel>> loadCountrys();
  Future<List<JobRoleModel>> loadJopRoles();
}
