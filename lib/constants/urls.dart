import 'package:fluttertest/constants/environment.dart';

class URLs {
  URLs._();

  static final String domain = Environment().config.domain;
  static final String api = '$domain/api';
}
