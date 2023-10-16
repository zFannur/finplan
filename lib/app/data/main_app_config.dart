import 'package:injectable/injectable.dart';

import '../domain/app_config.dart';

@Singleton(as:  AppConfig)
@prod
class ProdAppConfig implements AppConfig {
  @override
  String get baseUrl => "http://localhost:8080";

  @override
  String get host => Environment.prod;
}

@Singleton(as:  AppConfig)
@dev
class DevAppConfig implements AppConfig {
  @override
  String get baseUrl => "https://localhost:8080";

  @override
  String get host => Environment.dev
  ;
}

@Singleton(as:  AppConfig)
@test
class TestAppConfig implements AppConfig {
  @override
  String get baseUrl => "https://localhost:8080";

  @override
  String get host => Environment.test
  ;
}