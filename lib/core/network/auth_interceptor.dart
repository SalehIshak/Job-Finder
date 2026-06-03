import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/local/local_keys.dart';
import 'package:job_finder/core/local/pref_helper.dart';

@singleton
class AuthInterceptor implements Interceptor {
  final PrefHelper _prefHelper;
  AuthInterceptor(this._prefHelper);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = _prefHelper.getString(AppLocalKeys.tokenKey);

    if (token != null && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }

    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _prefHelper.clearFromSharedPrefs(AppLocalKeys.tokenKey);
    }
    handler.next(err);
  }
}
