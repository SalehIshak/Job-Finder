import 'package:injectable/injectable.dart';
import 'package:job_finder/features/shared_features/complate_profile/data/models/country_model.dart';
import 'package:job_finder/features/shared_features/complate_profile/data/models/job_role_model.dart';
import 'package:job_finder/features/shared_features/complate_profile/domain/entitys/country_entity.dart';
import 'package:job_finder/features/shared_features/complate_profile/domain/entitys/job_role_entity.dart';

import '../../domain/repository/complete_profile_repository.dart';
import '../datasurse/complete_profile_local_datasource_impl.dart';

@Injectable(as: CompleteProfileRepository)
class CompleteProfileRepositoryImpl implements CompleteProfileRepository {
  CompleteProfileLocalDatasourceImpl completeProfileLocalDatasourceImpl;
  CompleteProfileRepositoryImpl(this.completeProfileLocalDatasourceImpl);
  @override
  Future<List<CountryEntity>> getCountrys() async {
    List<CountryModel> countrys = await completeProfileLocalDatasourceImpl.loadCountrys();
    return countrys.map((element) => element.toEntity()).toList();
  }

  @override
  Future<List<JobRoleEntity>> getJopRole() async {
    List<JobRoleModel> jobRoles = await completeProfileLocalDatasourceImpl.loadJopRoles();
    return jobRoles.map((element) => element.toEntity()).toList();
  }
}
