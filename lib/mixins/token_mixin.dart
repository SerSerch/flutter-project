import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin TokenMixin {
  Future<RequestOptions> checkTokenAndAddToHeaders(
      RequestOptions options) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('@token');
    if (token != null) {
      String t = token;

      options.headers['Authorization'] = 'Bearer $t';
    }

    return options;
  }

  Future<void> addTokenToStorage({
    required String token,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('@token', token);
  }

  Future<void> removeTokenFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('@token');
    prefs.remove('@refresh_token');
  }

  Future<void> removeTokenFromStorageByCondition(
    Response<dynamic> response,
  ) async {
    if (response.requestOptions.path == '/v1/auth/logout' &&
            response.statusCode == 204 ||
        response.requestOptions.path == '/v1/profile' &&
            response.statusCode == 204 &&
            response.requestOptions.method == 'DELETE') {
      await removeTokenFromStorage();
    }
  }
}
