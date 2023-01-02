import 'package:dio/dio.dart';

class Logging extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('REQUEST [${options.method}] => PATH:${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    print(
        'RESPONSE[${response.statusCode}]=>PATH:${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) async {
    print(
        'ERROR[${error.response?.statusCode}] => PATH:${error.requestOptions.path}');
    super.onError(error, handler);
  }
}
