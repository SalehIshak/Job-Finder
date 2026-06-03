import 'package:injectable/injectable.dart';
import 'package:job_finder/features/shared_features/complate_profile/domain/entitys/country_entity.dart';
import 'package:job_finder/features/shared_features/complate_profile/domain/entitys/job_role_entity.dart';
import 'package:job_finder/features/shared_features/complate_profile/domain/repository/complete_profile_repository.dart';

@injectable
class GetCountrysUsecases {
  CompleteProfileRepository completeProfileRepository;
  GetCountrysUsecases(this.completeProfileRepository);

  Future<List<CountryEntity>> call() {
    return completeProfileRepository.getCountrys();
  }
}

@injectable
class GetJobRolesUseCases {
  CompleteProfileRepository completeProfileRepository;
  GetJobRolesUseCases(this.completeProfileRepository);

  Future<List<JobRoleEntity>> call() {
    return completeProfileRepository.getJopRole();
  }
}
