import 'package:flutter/material.dart';
import 'app/ui/main_app_builder.dart';
import 'app/ui/main_app_runner.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const env = String.fromEnvironment("env", defaultValue: "dev");
  const runner = MainAppRunner(env);
  final builder = MainAppBuilder();
  runner.run(builder);
}