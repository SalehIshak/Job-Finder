class ApiErrorModel {
  final int statusCode;
  final String errorMessage;

  ApiErrorModel({required this.statusCode, required this.errorMessage});

  factory ApiErrorModel.fromjson(Map<String, dynamic> json) {
    return ApiErrorModel(statusCode: json["statusCode"] ?? 0, errorMessage: json["message"] ?? "حدث خطأ غير معروف");
  }
}
