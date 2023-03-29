import 'package:dio/dio.dart';

class DioProvider {
  final String _baseUrl;

  DioProvider(this._baseUrl);

  BaseOptions _createBaseOptions() => BaseOptions(
        baseUrl: _baseUrl,
        receiveTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        connectTimeout: const Duration(seconds: 5),
      );

  Dio create() => Dio(_createBaseOptions())..interceptors.addAll([]);
}
