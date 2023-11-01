import 'package:finplan/app/const/app_local_data_keys.dart';
import 'package:finplan/app/data/data_source/app_local_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class AppCategoriesLocalDataSource {
  Future<List<String>> get(String key);

  Future<void> delete(String category, String key);

  Future<void> add(String category, String key);

  Future<void> edit(String category, String key);

  Future<void> close();
}

@Injectable(as: AppCategoriesLocalDataSource)
@prod
@dev
class AppCategoriesLocalDataSourceImpl implements AppCategoriesLocalDataSource {

  AppCategoriesLocalDataSourceImpl();

  AppLocalDataSource<String> getDataSource(String key) {
    return AppLocalDataSource<String>(
      key: key,
    );
  }

  @override
  Future<void> add(String category, String key) async {
    final dataSource = getDataSource(key);
    final box = await dataSource.openBox();
    bool isContain = box.values.toList().contains(category);
    return isContain ? null : dataSource.add(category);
  }

  @override
  Future<void> delete(String category, String key) async {
    final dataSource = getDataSource(key);
    return dataSource.delete(await getIndex(category, key));
  }

  @override
  Future<void> edit(String category, String key) async {
    final dataSource = getDataSource(key);
    return dataSource.edit(await getIndex(category, key), category);
  }

  @override
  Future<List<String>> get(String key) async {
    final dataSource = getDataSource(key);
    final box = await dataSource.openBox();
    return box.values.toList().reversed.toList();
  }

  @override
  Future<void> close() async {
    final noteBox = getDataSource(LocalDataConst.noteCategoryKey).getBox();
    final formBox = getDataSource(LocalDataConst.formCategoryKey).getBox();

    if (noteBox != null) {
      await noteBox.compact();
      await noteBox.close();
    }

    if (formBox != null) {
      await formBox.compact();
      await formBox.close();
    }
  }

  Future<int> getIndex(String category, String key) async {
    int index = 0;
    final dataSource = getDataSource(key);
    final box = await dataSource.openBox();
    final result = box.values.toList();

    for (; index < result.length; index++) {
      if (category == result[index]) {
        return index;
      }
    }

    return index + 1;
  }
}
