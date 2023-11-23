import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/domain/entities/category_entity.dart';
import 'package:finplan/app/ui/theme/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/domain/state/categories/categories_cubit.dart';
import '../../../../app/ui/components/app_button.dart';
import '../../../../app/ui/components/app_loader.dart';
import '../../../../app/ui/components/app_text_field.dart';
import '../../../../app/ui/theme/app_colors.dart';
import '../../../../app/ui/theme/app_text_style.dart';

class AppCategoryDialog extends StatefulWidget {
  const AppCategoryDialog({
    super.key,
  });

  @override
  State<AppCategoryDialog> createState() => _AppCategoryDialogState();
}

class _AppCategoryDialogState extends State<AppCategoryDialog> {
  Set<String> selectedCategories = {};
  final TextEditingController controllerName = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  late CategoryType valueType;

  @override
  void initState() {
    valueType = CategoryType.category;
    context.read<CategoriesCubit>().getUnloadedCategories(valueType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: AppColors.greyDark,
      children: [
        Padding(
          padding: AppPadding.all16,
          child: Column(
            children: [
              DropdownButton<CategoryType>(
                //isExpanded: true,
                iconSize: 24,
                alignment: Alignment.center,
                value: valueType,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.orange,
                ),
                elevation: 16,
                style: AppTextStyle.bold24,
                dropdownColor: AppColors.greyDark,
                underline: Container(
                  width: double.infinity,
                  height: 2,
                  color: AppColors.orange,
                ),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      valueType = value;
                    });
                    context
                        .read<CategoriesCubit>()
                        .getUnloadedCategories(valueType);
                  }
                },
                items: CategoryType.values
                    .map<DropdownMenuItem<CategoryType>>((value) {
                  return DropdownMenuItem<CategoryType>(
                    value: value,
                    child: Text(value.toStr()),
                  );
                }).toList(),
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: AppPadding.top8,
                  child: AppTextField(
                    labelText: 'Название',
                    controller: controllerName,
                  ),
                ),
              ),
              Padding(
                padding: AppPadding.top8,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: BlocBuilder<CategoriesCubit, CategoriesState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loaded: (List<dynamic> list) => SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Wrap(
                            children: List.generate(
                              list.length,
                              (index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: AppButton(
                                    isFixedSize: false,
                                    backgroundColor:
                                        selectedCategories.contains(list[index])
                                            ? AppColors.grey
                                            : AppColors.greyDark,
                                    onPressed: () {
                                      if (selectedCategories
                                          .contains(list[index])) {
                                        selectedCategories.remove(list[index]);
                                      } else {
                                        selectedCategories.add(list[index]);
                                      }
                                      setState(() {});
                                    },
                                    child: Text(
                                      list[index],
                                      style: AppTextStyle.medium14,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        loading: () => const AppLoader(),
                        error: (error) => Text(
                          error.toString(),
                          style: AppTextStyle.mediumRed20,
                        ),
                        orElse: () {
                          return const Text(
                            'Что то пошло не так',
                            style: AppTextStyle.mediumRed20,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: AppPadding.top8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                      onPressed: () {
                        context.read<CategoriesCubit>().getAllCategories();
                        context.popRoute();
                      },
                      child: const Text(
                        'Назад',
                        style: AppTextStyle.bold14,
                      ),
                    ),
                    AppButton(
                      onPressed: () {
                        if(selectedCategories.isNotEmpty) {
                          context.read<CategoriesCubit>().addList(
                              selectedCategories: selectedCategories.toList(),
                              categoryType: valueType);
                          selectedCategories = {};
                          context.read<CategoriesCubit>().getAllCategories();
                          context.popRoute();
                        }
                        if (formKey.currentState?.validate() == true) {
                          context.read<CategoriesCubit>().add(
                              name: controllerName.text,
                              categoryType: valueType);
                          context.read<CategoriesCubit>().getAllCategories();
                          context.popRoute();
                        }
                      },
                      child: const Text(
                        'Добавить',
                        style: AppTextStyle.bold14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
