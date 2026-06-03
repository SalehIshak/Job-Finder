import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/network/auth_interceptor.dart';
import 'package:job_finder/core/network/end_points.dart';

@singleton
class DioClinet {
  late final Dio dio;

  DioClinet(AuthInterceptor authInterceptor) {
    dio = Dio(
      BaseOptions(
        baseUrl: AppEndPoints.baseUrl,
        headers: {"Content-Type": "application/json"},
        // connectTimeout: Duration(seconds: 5),
        // receiveTimeout: Duration(seconds: 5),
        // sendTimeout: Duration(seconds: 5),
      ),
    );

    dio.interceptors.addAll([
      authInterceptor,
      LogInterceptor(
        // requestHeader: false, responseBody: false, requestBody: false, logPrint: (log) => print('🌐 $log')
      ),
    ]);
  }
}
