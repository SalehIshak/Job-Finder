import 'package:job_finder/features/shared_features/auth/data/models/get_profile_request_model.dart';
import 'package:job_finder/features/shared_features/auth/data/models/replace_profile_request_model.dart';
import 'package:job_finder/features/shared_features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> logIn(String email, String password);
  Future<UserModel> regester(String email, String password, String name, String phoneNumber, String address);
  Future<GetProfileRequestModel> getProfileData();
  Future<ReplaceProfileRequestModel> replaceUserData(String name, String phoneNumber, String address, String gender);
}
