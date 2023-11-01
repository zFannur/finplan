import 'package:finplan/app/const/app_local_data_keys.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../app_categories_repository.dart';

part 'categories_state.dart';

part 'categories_cubit.freezed.dart';

part 'categories_cubit.g.dart';

@Singleton()
class CategoriesCubit extends HydratedCubit<CategoriesState> {
  final AppCategoriesRepository repository;

  CategoriesCubit(this.repository) : super(const CategoriesState.loading());

  void getCategories(String key) async {
    try {
      emit(const CategoriesState.loading());
      final categories = await repository.get(key);
      emit(CategoriesState.loaded(categories));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> add({
    String? form,
    String? note,
  }) async {
    try {
      if (form != null) {
        await repository.add(form, LocalDataConst.formCategoryKey);
      }
      if (note != null) {
        await repository.add(note, LocalDataConst.noteCategoryKey);
      }
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> edit({
    String? form,
    String? note,
  }) async {
    try {
      if (form != null) {
        await repository.edit(form, LocalDataConst.formCategoryKey);
      }
      if (note != null) {
        await repository.edit(note, LocalDataConst.noteCategoryKey);
      }
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> delete(
    String? form,
    String? note,
  ) async {
    try {
      if (form != null) {
        await repository.delete(form, LocalDataConst.formCategoryKey);
      }
      if (note != null) {
        await repository.delete(note, LocalDataConst.noteCategoryKey);
      }
    } catch (error, st) {
      addError(error, st);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(CategoriesState.error(error));
    super.addError(error, stackTrace);
  }

  @override
  CategoriesState? fromJson(Map<String, dynamic> json) {
    final state = CategoriesState.fromJson(json);
    return state.whenOrNull(
      loaded: (categoriesList) => CategoriesState.loaded(categoriesList),
    );
  }

  @override
  Map<String, dynamic>? toJson(CategoriesState state) {
    return state
            .whenOrNull(
                loaded: (categoriesList) =>
                    CategoriesState.loaded(categoriesList))
            ?.toJson() ??
        const CategoriesState.loading().toJson();
  }
}
