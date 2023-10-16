import 'package:finplan/app/di/init_di.config.dart';
import 'package:finplan/feature/operation/data/data_source/local_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

@InjectableInit()
void initDi(String env) {
  locator.init(environment: env);
  locator.get<LocalDataSource>().init();
}