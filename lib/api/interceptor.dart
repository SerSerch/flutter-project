import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/api/exeptions/auth_exception.dart';
import 'package:fluttertest/api/exeptions/deadline_timeout_exception.dart';
import 'package:fluttertest/api/exeptions/server_exception.dart';
import 'package:fluttertest/mixins/token_mixin.dart';
import 'package:fluttertest/services/navigation_service.dart';

class CustomInterceptor extends Interceptor with TokenMixin {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');

    final newOptions = await checkTokenAndAddToHeaders(options);

    return super.onRequest(newOptions, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');

    await removeTokenFromStorageByCondition(response);

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final navigator = NavigationService.navigatorKey;
    final context = navigator.currentContext;

    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    switch (err.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return super.onError(
          DeadlineExceededException(
            requestOptions: err.requestOptions,
            response: err.response,
          ),
          handler,
        );

      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 401:
            await removeTokenFromStorage();
            if (context != null && context.mounted) {
              // final Auth auth = Provider.of<Auth>(context, listen: false);
              // await auth.logout();
              // SignInRoute().go(context);
            }

            break;
          case 422:
            return super.onError(
              ValidationError(
                requestOptions: err.requestOptions,
                response: err.response,
              ),
              handler,
            );
          case 500:
            return super.onError(
              ServerException(
                requestOptions: err.requestOptions,
                response: err.response,
              ),
              handler,
            );
        }
        break;

      case DioErrorType.cancel:
        break;
      case DioErrorType.badCertificate:
        break;
      case DioErrorType.connectionError:
        break;
      case DioErrorType.unknown:
        break;
    }
    return super.onError(err, handler);
  }
}
