import 'package:dio/dio.dart';

class DeadlineExceededException extends DioError {
  DeadlineExceededException({
    required super.requestOptions,
    super.response,
    super.type,
    super.error,
  });

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
