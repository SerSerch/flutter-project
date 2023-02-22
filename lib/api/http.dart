import 'package:dio/dio.dart';
// import 'package:fluttertest/api/interceptor.dart';
import 'package:fluttertest/constants/urls.dart';

class HTTP {
  final dio = createDio();

  HTTP._internal();

  static final _singleton = HTTP._internal();

  factory HTTP() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: URLs.api,
      receiveTimeout: const Duration(seconds: 15), // 15 seconds
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
    ));

    // dio.interceptors.add(CustomInterceptor());
    return dio;
  }
}
