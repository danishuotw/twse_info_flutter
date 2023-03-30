import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LogInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final url = options.baseUrl;
    final path = options.path;
    if (kDebugMode) print('${options.method} request => $url$path');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (kDebugMode) print('StatusCode: ${response.statusCode}, Data: ${response.data}'); // Debug log)
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    if (kDebugMode) print('${options.method} request => $requestPath'); // Debug log
    if (kDebugMode) print('Error: ${err.error}, Message: ${err.message}'); // Error log
    return super.onError(err, handler);
  }
}
