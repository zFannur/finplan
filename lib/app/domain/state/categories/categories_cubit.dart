import 'package:finplan/app/const/app_local_data_keys.dart';
import 'package:finplan/app/domain/entities/category_entity.dart';
import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../feature/operation/domain/usecase/operation_usecase.dart';
import '../../app_categories_repository.dart';

part 'categories_state.dart';

part 'categories_cubit.freezed.dart';

part 'categories_cubit.g.dart';

@Singleton()
class CategoriesCubit extends HydratedCubit<CategoriesState> {
  final OperationUseCase operationUseCase;
  final AppCategoriesRepository repository;

  CategoriesCubit(
    this.repository,
    this.operationUseCase,
  ) : super(const CategoriesState.loading());

  void getCategories(String key) async {
    try {
      emit(const CategoriesState.loading());
      final categories = await repository.get(key);
      emit(CategoriesState.loaded(categories));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> getAllCategories() async {
    try {
      emit(const CategoriesState.loading());
      final category = await repository.get(LocalDataConst.categoryKey);
      final underCategory =
          await repository.get(LocalDataConst.underCategoryKey);
      emit(CategoriesState.allLoaded(
        category: category,
        underCategory: underCategory,
      ));
    } catch (error, st) {
      addError(error, st);
    }
  }

  void getUnloadedCategories(CategoryType categoryType) async {
    try {
      emit(const CategoriesState.loading());

      Set<String> categories = {};

      switch (categoryType) {
        case CategoryType.category:
          categories = (await repository.get(LocalDataConst.categoryKey)).toSet();
        case CategoryType.underCategory:
          categories = (await repository.get(LocalDataConst.underCategoryKey)).toSet();
        case CategoryType.target:
        case CategoryType.since:
        case CategoryType.habit:
      }

      final List<OperationEntity> operationList =
          await operationUseCase.getOperation();

      //получение всех категорий
      Set<String> categoriesOperations = {};

      switch (categoryType) {
        case CategoryType.category:
          for (var element in operationList) {
            categoriesOperations.add(element.category);
          }
        case CategoryType.underCategory:
          for (var element in operationList) {
            categoriesOperations.add(element.underCategory);
          }
        case CategoryType.target:
        case CategoryType.since:
        case CategoryType.habit:
      }

      categoriesOperations.removeAll(categories);

      emit(CategoriesState.loaded(categoriesOperations.toList()));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> add({
    required String name,
    required CategoryType categoryType,
  }) async {
    try {
      switch (categoryType) {
        case CategoryType.category:
          await repository.add(name, LocalDataConst.categoryKey);
        case CategoryType.underCategory:
          await repository.add(name, LocalDataConst.underCategoryKey);
        case CategoryType.target:
          await repository.add(name, LocalDataConst.targetKey);
        case CategoryType.since:
          await repository.add(name, LocalDataConst.sinceKey);
        case CategoryType.habit:
          await repository.add(name, LocalDataConst.habitKey);
      }
      getAllCategories();
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> addList({
    required List<String> selectedCategories,
    required CategoryType categoryType,
  }) async {
    try {
      switch (categoryType) {
        case CategoryType.category:
          await repository.addList(
            selectedCategories,
            LocalDataConst.categoryKey,
          );
        case CategoryType.underCategory:
          await repository.addList(
            selectedCategories,
            LocalDataConst.underCategoryKey,
          );
        case CategoryType.target:
        case CategoryType.since:
        case CategoryType.habit:
      }
      getAllCategories();
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> edit({
    String? category,
    String? underCategory,
  }) async {
    try {
      if (category != null) {
        await repository.edit(category, LocalDataConst.categoryKey);
      }
      if (underCategory != null) {
        await repository.edit(underCategory, LocalDataConst.underCategoryKey);
      }
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> delete({
    String? category,
    String? underCategory,
  }) async {
    try {
      if (category != null) {
        await repository.delete(category, LocalDataConst.categoryKey);
      }
      if (underCategory != null) {
        await repository.delete(underCategory, LocalDataConst.underCategoryKey);
      }
      getAllCategories();
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
