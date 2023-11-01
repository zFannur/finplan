import 'package:finplan/app/domain/app_categories_repository.dart';
import 'package:injectable/injectable.dart';

import 'data_source/app_categories_local_data_source.dart';

@Injectable(as: AppCategoriesRepository)
@prod
@dev
class AppCategoriesRepositoryImpl implements AppCategoriesRepository {
  final AppCategoriesLocalDataSource _localDataSource;

  AppCategoriesRepositoryImpl(this._localDataSource);

  @override
  Future<void> add(String category, String key) async {
    _localDataSource.add(category, key);
  }

  @override
  Future<void> delete(String category, String key) async {
    await _localDataSource.delete(category, key);
  }

  @override
  Future<void> edit(String category, String key) async{
    await _localDataSource.edit(category, key);
  }

  @override
  Future<List<String>> get(String key) {
    return _localDataSource.get(key);
  }
}