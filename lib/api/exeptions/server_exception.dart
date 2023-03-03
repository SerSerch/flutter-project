import 'package:dio/dio.dart';

class ServerException extends DioError {
  ServerException({
    required super.requestOptions,
    super.response,
    super.type,
    super.error,
  });

  @override
  String toString() {
    final int? code = response!.statusCode;
    final String message = response?.data['message'].isEmpty
        ? 'Server error'
        : response?.data['message'];
    final String? filePath = response!.data['file'];
    return '$code: $message\n $filePath';
  }
}
