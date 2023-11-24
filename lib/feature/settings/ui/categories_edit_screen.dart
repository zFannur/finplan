import 'package:auto_route/annotations.dart';
import 'package:finplan/app/domain/entities/category_entity.dart';
import 'package:finplan/app/domain/state/categories/categories_cubit.dart';
import 'package:finplan/app/ui/components/app_bar.dart';
import 'package:finplan/app/ui/components/app_loader.dart';
import 'package:finplan/app/ui/theme/app_colors.dart';
import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:finplan/app/ui/theme/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/add_categoty_dialog.dart';

@RoutePage()
class CategoriesEditScreen extends StatelessWidget {
  const CategoriesEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesCubit = context.read<CategoriesCubit>();
    return Scaffold(
      appBar: const AppAppBar(
        name: 'Категории',
        withSettings: false,
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const AppLoader(),
            allLoaded: (category, underCategory, target, since, habit) {
              List<Widget> child = [];
              if (category != null) {
                child.add(
                  CategoryListWidget(
                    list: category,
                    categoryType: CategoryType.category,
                  ),
                );
              }

              if (underCategory != null) {
                child.add(
                  CategoryListWidget(
                    list: underCategory,
                    categoryType: CategoryType.underCategory,
                  ),
                );
              }

              if (target != null) {
                child.add(
                  CategoryListWidget(
                    list: target,
                    categoryType: CategoryType.target,
                  ),
                );
              }

              if (since != null) {
                child.add(
                  CategoryListWidget(
                    list: since,
                    categoryType: CategoryType.since,
                  ),
                );
              }

              if (habit != null) {
                child.add(
                  CategoryListWidget(
                    list: habit,
                    categoryType: CategoryType.habit,
                  ),
                );
              }
              return ListView(
                children: child,
              );
            },
            orElse: () => const AppLoader(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => const AppCategoryDialog(),
          );
          categoriesCubit.getAllCategories();
        },
        child: const Icon(
          Icons.add,
          color: AppColors.orange,
        ),
      ),
    );
  }
}

class CategoryListWidget extends StatelessWidget {
  final CategoryType categoryType;
  final List<dynamic> list;

  const CategoryListWidget({
    super.key,
    required this.categoryType,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: AppPadding.all8,
          color: AppColors.greyDark,
          width: double.infinity,
          height: 50,
          child: Text(
            categoryType.toStr(),
            style: AppTextStyle.bold24,
          ),
        ),
        Column(
          children: List.generate(
            list.length,
            (index) => Container(
              margin: AppPadding.top8,
              padding: AppPadding.horizontal16,
              color: AppColors.grey,
              width: double.infinity,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    list[index],
                    style: AppTextStyle.mediumBlack20,
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CategoriesCubit>().delete(
                            name: list[index],
                            categoryType: categoryType,
                          );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

extension on CategoryType {
  String toStr() {
    switch (this) {
      case CategoryType.category:
        return 'Категории';
      case CategoryType.underCategory:
        return 'Подкатегории';
      case CategoryType.target:
        return 'Цели';
      case CategoryType.since:
        return 'Навыки';
      case CategoryType.habit:
        return 'Привычки';
      default:
        throw Exception(['Ошибка преобразования данных']);
    }
  }
}
