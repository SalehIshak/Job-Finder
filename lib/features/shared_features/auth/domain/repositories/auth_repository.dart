import 'package:dartz/dartz.dart';
import 'package:job_finder/core/errors/failur.dart';
import 'package:job_finder/features/shared_features/auth/domain/entitys/get_profile_emtity.dart';
import 'package:job_finder/features/shared_features/auth/domain/entitys/replace_profile_entity.dart';
import 'package:job_finder/features/shared_features/auth/domain/entitys/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> logIn(String email, String password);
  Future<Either<Failure, UserEntity>> regester(String email, String password, String name, String phoneNumber, String address);
  Future<Either<Failure, GetProfileEntity>> getProtileData();
  Future<Either<Failure, ReplaceProfileEntity>> replaceUserData(String name, String phoneNumber, String address, String gender);
}
