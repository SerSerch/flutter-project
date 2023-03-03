import 'dart:convert';

import 'package:dio/dio.dart';

class ValidationError extends DioError {
  ValidationError({
    required super.requestOptions,
    super.response,
    super.type,
    super.error,
  });

  @override
  String toString() {
    final List errors =
        response!.data['errors'].values.map((value) => value).toList();

    final json = {
      'code': response!.data['code'],
      'message': response!.data['message'],
      'errorsList': errors,
      'errorsMap': response!.data['errors']
    };
    return jsonEncode(json);
  }
}
