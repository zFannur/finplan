import 'package:auto_route/annotations.dart';
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
    return Scaffold(
      appBar: const AppAppBar(
        name: 'Категории',
        withSettings: false,
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const AppLoader(),
            allLoaded: (category, underCategory) {
              List<Widget> child = [];
              if (category != null || underCategory != null) {
                if (category != null) {
                  child.add(
                    Column(
                      children: [
                        Container(
                          padding: AppPadding.all8,
                          color: AppColors.greyDark,
                          width: double.infinity,
                          height: 50,
                          child: const Text(
                            'Категории',
                            style: AppTextStyle.bold24,
                          ),
                        ),
                        Column(
                          children: List.generate(
                            category.length,
                            (index) => Container(
                              margin: AppPadding.top8,
                              padding: AppPadding.horizontal16,
                              color: AppColors.grey,
                              width: double.infinity,
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    category[index],
                                    style: AppTextStyle.mediumBlack20,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .read<CategoriesCubit>()
                                          .delete(category: category[index]);
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
                    ),
                  );
                }

                if (underCategory != null) {
                  child.add(
                    Column(
                      children: [
                        Container(
                          padding: AppPadding.all8,
                          color: AppColors.greyDark,
                          width: double.infinity,
                          height: 50,
                          child: const Text(
                            'Под категории',
                            style: AppTextStyle.bold24,
                          ),
                        ),
                        Column(
                          children: List.generate(
                            underCategory.length,
                            (index) => Container(
                              margin: AppPadding.top8,
                              padding: AppPadding.horizontal16,
                              color: AppColors.grey,
                              width: double.infinity,
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    underCategory[index],
                                    style: AppTextStyle.mediumBlack20,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        context.read<CategoriesCubit>().delete(
                                            underCategory:
                                                underCategory[index]);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: AppColors.red,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView(
                  children: child,
                );
              } else {
                return const Text(
                  'Нету категориев',
                  style: AppTextStyle.bold24,
                );
              }
            },
            orElse: () => const Text(
              'Что то пошло не так',
              style: AppTextStyle.mediumRed20,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AppCategoryDialog(),
          );
        },
        child: const Icon(
          Icons.add,
          color: AppColors.orange,
        ),
      ),
    );
  }
}
