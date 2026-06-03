import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/errors/api_exceptions.dart';
import 'package:job_finder/core/network/api_services.dart';
import 'package:job_finder/core/network/end_points.dart';
import 'package:job_finder/features/shared_features/auth/data/datasurce/auth_remote_datasource.dart';
import 'package:job_finder/features/shared_features/auth/data/models/get_profile_request_model.dart';
import 'package:job_finder/features/shared_features/auth/data/models/replace_profile_request_model.dart';
import 'package:job_finder/features/shared_features/auth/data/models/user_model.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDatasourceImp implements AuthRemoteDataSource {
  final ApiServices _apiServices;

  AuthRemoteDatasourceImp(this._apiServices);
  // LOIN
  @override
  Future<UserModel> logIn(String email, String password) async {
    try {
      final response = await _apiServices.post(AppEndPoints.login, {AppApiKeys.email: email, AppApiKeys.password: password});
      return UserModel.fromJson(response);
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }

  // REGESTER
  @override
  Future<UserModel> regester(String email, String password, String name, String phoneNumber, String address) async {
    // print("--- *********** Datasource: بدأ ---");
    try {
      final response = await _apiServices.post(AppEndPoints.register, {
        AppApiKeys.email: email,
        AppApiKeys.password: password,
        AppApiKeys.fullName: name,
        AppApiKeys.phone: phoneNumber,
        AppApiKeys.address: address,
      });
      // print("--- ****************Datasource: response = $response ---");
      return UserModel.fromJson(response);
    } on DioException catch (error) {
      // print("---************ Datasource: error = $error ---");

      throw handelDioException(error);
    }
  }

  @override
  Future<GetProfileRequestModel> getProfileData() async {
    try {
      final response = await _apiServices.get(AppEndPoints.userProfile);
      return GetProfileRequestModel.fromJson(response);
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }

  @override
  Future<ReplaceProfileRequestModel> replaceUserData(String name, String phoneNumber, String address, String gender) async {
    try {
      final response = await _apiServices.put(AppEndPoints.authApdate, {
        AppApiKeys.fullName: name,
        AppApiKeys.phoneNumber: phoneNumber,
        AppApiKeys.address: address,
        AppApiKeys.gender: gender,
      });

      return ReplaceProfileRequestModel.fromJson(response);
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }
}
