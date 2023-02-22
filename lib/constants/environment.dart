abstract class BaseConfig {
  String get domain;
}

class Development implements BaseConfig {
  @override
  String get domain => 'https://test.cc';
}

class Production implements BaseConfig {
  @override
  String get domain => 'https://test-prod.cc';
}

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String development = 'development';
  static const String production = 'production';

  late BaseConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.production:
        return Production();
      default:
        return Development();
    }
  }
}
