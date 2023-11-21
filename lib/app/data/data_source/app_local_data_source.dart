import 'package:hive/hive.dart';

class AppLocalDataSource<T> {
  final String key;
  final int? typeId;
  final TypeAdapter<T>? adapter;

  AppLocalDataSource({
    required this.key,
    this.typeId,
    this.adapter,
  });

  Future<void> edit(int index, T value) async {
    final box = await openBox();
    return box.putAt(index, value);
  }

  Future<void> set(dynamic key, T value) async {
    final box = await openBox();
    return box.put(key, value);
  }

  Future<void> add(T value) async {
    final box = await openBox();
    box.add(value);
  }

  Future<void> addList(List<T> value) async {
    final box = await openBox();
    box.addAll(value);
  }

  Future<T?> get() async {
    final box = await openBox();
    return box.get(key);
  }

  Future<void> delete(int index) async {
    final box = await openBox();
    return box.deleteAt(index);
  }

  Future<void> close(Box<T> box) async {
    await box.compact();
    await box.close();
  }

  Future<void> clear(Box<T> box) async {
    final box = await openBox();
    await box.clear();
  }


  Future<Box<T>> openBox() async {
    if (typeId != null && adapter != null) {
      if (!Hive.isAdapterRegistered(typeId!)) {
        Hive.registerAdapter(adapter!);
      }
    }
    return Hive.openBox<T>(key);
  }

  Box<T>? getBox() {
    if(Hive.isBoxOpen(key)) {
      return Hive.box<T>(key);
    } else {
      return null;
    }
  }
}
