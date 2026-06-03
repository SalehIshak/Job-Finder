import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/errors/failur.dart';
import 'package:job_finder/features/shared_features/auth/domain/entitys/get_profile_emtity.dart';
import 'package:job_finder/features/shared_features/auth/domain/entitys/replace_profile_entity.dart';
import 'package:job_finder/features/shared_features/auth/domain/entitys/user_entity.dart';
import 'package:job_finder/features/shared_features/auth/domain/repositories/auth_repository.dart';

//LOGIN
@injectable
class LoginUseCase {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);

  Future<Either<Failure, UserEntity>> call(String email, String password) {
    return _authRepository.logIn(email, password);
  }
}

//  REGESTER
@injectable
class RegisterUseCase {
  final AuthRepository _authRepository;
  RegisterUseCase(this._authRepository);
  Future<Either<Failure, UserEntity>> call(String email, String password, String name, String phoneNumber, String address) async {
    return _authRepository.regester(email, password, name, phoneNumber, address);
  }
}

// GET PROFILE DATA
@injectable
class GetProfileUseCase {
  final AuthRepository _authRepository;
  GetProfileUseCase(this._authRepository);
  Future<Either<Failure, GetProfileEntity>> call() {
    return _authRepository.getProtileData();
  }
}

//UPDATE PROFILE DATA (PUT METHOD) => REPLACE
@injectable
class ReplaceProfileUseCase {
  final AuthRepository _authRepository;
  ReplaceProfileUseCase(this._authRepository);
  Future<Either<Failure, ReplaceProfileEntity>> call(String name, String phoneNumber, String address, String gender) async {
    return _authRepository.replaceUserData(name, phoneNumber, address, gender);
  }
}
