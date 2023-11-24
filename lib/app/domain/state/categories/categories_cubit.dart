import 'package:finplan/app/const/app_local_data_keys.dart';
import 'package:finplan/app/domain/entities/category_entity.dart';
import 'package:finplan/feature/finance/domain/plan_entity/plan_entity.dart';
import 'package:finplan/feature/finance/domain/usecase/plan_usecase.dart';
import 'package:finplan/feature/finance/ui/bloc/plan_cubit/finance_plan_cubit.dart';
import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../feature/operation/domain/usecase/operation_usecase.dart';
import '../../app_categories_repository.dart';

part 'categories_state.dart';

part 'categories_cubit.freezed.dart';

part 'categories_cubit.g.dart';

@Singleton()
class CategoriesCubit extends HydratedCubit<CategoriesState> {
  final OperationUseCase operationUseCase;
  final PlanUseCase planUseCase;
  final AppCategoriesRepository repository;
  final FinancePlanCubit financePlanCubit;

  CategoriesCubit(
    this.repository,
    this.operationUseCase,
    this.planUseCase,
    this.financePlanCubit,
  ) : super(const CategoriesState.loading());

  Future<void> getCategories(String key) async {
    try {
      emit(const CategoriesState.loading());
      final categories = await repository.get(key);
      emit(CategoriesState.loaded(categories));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> searchCategories(String key, String name) async {
    try {
      emit(const CategoriesState.loading());
      final List<String> filtered = [];

      final categories = await repository.get(key);

      for (final item in categories) {
        if (item.toLowerCase().contains(name.toLowerCase())) {
          filtered.add(item);
        }
      }

      emit(CategoriesState.loaded(filtered));
    } catch (error, st) {
      addError(error, st);
    }
  }

  void getPlanCategories(PlanType planType) async {
    try {
      emit(const CategoriesState.loading());

      Set<String> categories = {};

      switch (planType) {
        case PlanType.expense:
          categories =
              (await repository.get(LocalDataConst.categoryKey)).toSet();
        case PlanType.income:
          categories =
              (await repository.get(LocalDataConst.categoryKey)).toSet();
        case PlanType.target:
          categories = (await repository.get(LocalDataConst.targetKey)).toSet();
        case PlanType.since:
          categories = (await repository.get(LocalDataConst.sinceKey)).toSet();
        case PlanType.habit:
          categories = (await repository.get(LocalDataConst.habitKey)).toSet();
      }

      List<PlanEntity> planList = await planUseCase.getPlan();

      DateFormat dateFormat = DateFormat("yyyy-MM-dd");

      final List<PlanEntity> planListFiltered = planList
          .where((element) =>
              dateFormat.parse(element.date).month ==
                  financePlanCubit.state.selectMonth &&
              dateFormat.parse(element.date).year ==
                  financePlanCubit.state.selectYear)
          .toList();

      for (var element in planListFiltered) {
        categories.remove(element.category);
      }

      emit(CategoriesState.loaded(categories.toList()));
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
      final target =
      await repository.get(LocalDataConst.targetKey);
      final since =
      await repository.get(LocalDataConst.sinceKey);
      final habit =
      await repository.get(LocalDataConst.habitKey);
      emit(
        CategoriesState.allLoaded(
          category: category,
          underCategory: underCategory,
          target: target,
          since: since,
          habit: habit,
        ),
      );
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
          categories =
              (await repository.get(LocalDataConst.categoryKey)).toSet();
        case CategoryType.underCategory:
          categories =
              (await repository.get(LocalDataConst.underCategoryKey)).toSet();
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
    required String name,
    required CategoryType categoryType,
  }) async {
    try {
      switch (categoryType) {
        case CategoryType.category:
          await repository.delete(name, LocalDataConst.categoryKey);
        case CategoryType.underCategory:
          await repository.delete(name, LocalDataConst.underCategoryKey);
        case CategoryType.target:
          await repository.delete(name, LocalDataConst.targetKey);
        case CategoryType.since:
          await repository.delete(name, LocalDataConst.sinceKey);
        case CategoryType.habit:
          await repository.delete(name, LocalDataConst.habitKey);
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
