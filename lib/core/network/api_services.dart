import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/errors/api_exceptions.dart';
import 'package:job_finder/core/network/dio_clinet.dart';
import 'package:job_finder/core/network/end_points.dart';

@singleton
class ApiServices {
  final Dio _dio;

  ApiServices(DioClinet dioClinet) : _dio = dioClinet.dio;

  Future<dynamic> put(String endPoint, dynamic body) async {
    try {
      final response = await _dio.put(endPoint, data: body);
      return response.data;
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }

  Future<dynamic> post(String endPoint, dynamic body) async {
    try {
      final response = await _dio.post(endPoint, data: body);
      return response.data;
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }

  Future<dynamic> patch(String endPoint, dynamic body) async {
    try {
      final response = await _dio.patch(endPoint, data: body);
      return response.data;
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }

  Future<dynamic> get(String endPoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(endPoint, queryParameters: queryParams);
      return response.data;
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }

  Future<dynamic> delete(String jobId, {dynamic body, dynamic queryParams}) async {
    try {
      final response = await _dio.delete(AppEndPoints.deleteJob(jobId));
      return response.data;
    } on DioException catch (error) {
      throw handelDioException(error);
    }
  }
}
