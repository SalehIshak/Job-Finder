import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/errors/api_exceptions.dart';
import 'package:job_finder/core/errors/failur.dart';
import 'package:job_finder/features/shared_features/auth/data/datasurce/auth_remote_datasource.dart';
import 'package:job_finder/features/shared_features/auth/data/models/user_model.dart';
import 'package:job_finder/features/shared_features/auth/domain/entitys/replace_profile_entity.dart';
import 'package:job_finder/features/shared_features/auth/domain/entitys/get_profile_emtity.dart';
import 'package:job_finder/features/shared_features/auth/domain/entitys/user_entity.dart';
import 'package:job_finder/features/shared_features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepositoryImp(this._remoteDataSource);

  //  LOGIN
  @override
  Future<Either<Failure, UserEntity>> logIn(String email, String password) async {
    try {
      final UserModel userData = await _remoteDataSource.logIn(email, password);
      return Right(userData.data.toEntity());
    } on ServerException catch (error) {
      return Left(Failure(error.apiErrorModel.errorMessage));
    }
  }

  // REGESTER
  @override
  Future<Either<Failure, UserEntity>> regester(
    String email,
    String password,
    String name,
    String phoneNumber,
    String address,
  ) async {
    try {
      final userData = await _remoteDataSource.regester(email, password, name, phoneNumber, address);
      return Right(userData.data.toEntity());
    } on ServerException catch (error) {
      return Left(Failure(error.apiErrorModel.errorMessage));
    }
  }

  // GETPROFILEDATA
  @override
  Future<Either<Failure, GetProfileEntity>> getProtileData() async {
    try {
      final response = await _remoteDataSource.getProfileData();
      return Right(response.data.toEntity());
    } on ServerException catch (error) {
      return Left(Failure(error.apiErrorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, ReplaceProfileEntity>> replaceUserData(
    String name,
    String phoneNumber,
    String address,
    String gender,
  ) async {
    try {
      final response = await _remoteDataSource.replaceUserData(name, phoneNumber, address, gender);
      return Right(response.data.toEntity());
    } on ServerException catch (error) {
      throw Left(Failure(error.apiErrorModel.errorMessage));
    }
  }
}
