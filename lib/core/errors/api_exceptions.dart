import 'package:dio/dio.dart';
import 'package:job_finder/core/errors/api_error_model.dart';

class ServerException {
  final ApiErrorModel apiErrorModel;
  ServerException({required this.apiErrorModel});
}

Never handelDioException(DioException error) {
  switch (error.type) {
    // states that dosen't has an response forom server
    case DioExceptionType.connectionTimeout:
      throw ServerException(
        apiErrorModel: ApiErrorModel(statusCode: 0, errorMessage: "إنتهت مهلة الأتصال ، تحقق من الأتصال بالأنترنت"),
      );

    case DioExceptionType.sendTimeout:
      throw ServerException(
        apiErrorModel: ApiErrorModel(statusCode: 0, errorMessage: "إنتهت مهلة ارسال البيانات : حاول مرة أخرى"),
      );

    case DioExceptionType.receiveTimeout:
      throw ServerException(
        apiErrorModel: ApiErrorModel(statusCode: 0, errorMessage: "إنتهت مهلة إستقبال البيانات : حاول مرة أخرى"),
      );

    case DioExceptionType.badCertificate:
      throw ServerException(apiErrorModel: ApiErrorModel(statusCode: 0, errorMessage: "حدث خطأ غير متوقع "));

    case DioExceptionType.cancel:
      throw ServerException(apiErrorModel: ApiErrorModel(statusCode: 0, errorMessage: "تم إلغاء الطلب"));

    case DioExceptionType.connectionError:
      throw ServerException(apiErrorModel: ApiErrorModel(statusCode: 0, errorMessage: "لا يوجد إتصال بالأنترنت"));

    case DioExceptionType.unknown:
      throw ServerException(apiErrorModel: ApiErrorModel(statusCode: 0, errorMessage: "حدث خطأ غير متوقع "));

    // state that hase response from server
    case DioExceptionType.badResponse:
      // final response = error.response?.data;
      final statusCode = error.response?.statusCode ?? 0;

      // if (response is Map<String, dynamic>) {
      //   throw ServerException(apiErrorModel: ApiErrorModel.fromjson(response));
      // }

      // print("❌ Response Body: $response");
      // print("❌ Response Keys: ${response?.keys}");

      throw ServerException(
        apiErrorModel: ApiErrorModel(statusCode: statusCode, errorMessage: messageFromStatusCode(statusCode)),
      );
  }
}

String messageFromStatusCode(int statusCode) {
  return switch (statusCode) {
    400 => 'بيانات غير صحيحة',
    401 => 'غير مصرح لك، سجّل الدخول من جديد',
    403 => 'ليس لديك صلاحية',
    404 => 'البيانات المطلوبة غير موجودة',
    409 => 'البيانات موجودة مسبقاً',
    422 => 'خطأ في التحقق من البيانات',
    500 => 'خطأ في السيرفر، حاول لاحقاً',
    503 => 'الخدمة غير متاحة مؤقتاً',
    _ => 'خطأ ($statusCode)',
  };
}
