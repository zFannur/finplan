import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/const/app_const.dart';
import 'package:finplan/app/router/app_router.dart';
import 'package:finplan/app/ui/theme/app_colors.dart';
import 'package:finplan/app/ui/theme/app_icons.dart';
import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:finplan/app/ui/theme/consts.dart';
import 'package:finplan/feature/experience/domain/entity/habit_entity.dart';
import 'package:finplan/feature/experience/ui/bloc/habit_cubit/habit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/domain/error_entity/error_entity.dart';
import '../../../app/ui/components/app_loader.dart';
import '../../../app/ui/components/app_snack_bar.dart';

@RoutePage()
class HabitPage extends StatelessWidget {
  const HabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HabitCubit, HabitState>(
        listener: (context, state) {
          // if (state.asyncSnapshot?.hasData == true) {
          //   AppSnackBar.showSnackBarWithMessage(
          //     context,
          //     state.asyncSnapshot?.data,
          //   );
          // }

          if (state.asyncSnapshot?.hasError == true) {
            AppSnackBar.showSnackBarWithError(
              context,
              ErrorEntity.fromException(state.asyncSnapshot?.error),
            );
          }
        },
        builder: (context, state) {
          if (state.asyncSnapshot?.connectionState == ConnectionState.waiting) {
            return const AppLoader();
          }

          if (state.habitList?.isNotEmpty == true) {
            return ListView.separated(
              itemCount: state.habitList!.length,
              itemBuilder: (BuildContext context, int index) {
                return HabitItemWidget(
                  habit: state.habitList![index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 4);
              },
            );
          }

          return const Center(
            child: Text(
              "Нету привычек",
              style: AppTextStyle.bold24,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: '1',
        onPressed: () {
          context.pushRoute(
            HabitDetailRoute(
              onTap: (habit) {
                context.read<HabitCubit>().addHabit(habit);
                // context.read<CategoriesCubit>().add(
                //       name: operationEntity.category,
                //       categoryType: CategoryType.category,
                //     );
                // context.read<CategoriesCubit>().add(
                //       name: operationEntity.category,
                //       categoryType: CategoryType.underCategory,
                //     );
                context.popRoute();
              },
            ),
          );
        },
        child: AppIcons.add,
      ),
    );
  }
}

class HabitItemWidget extends StatelessWidget {
  final HabitEntity habit;

  const HabitItemWidget({
    super.key,
    required this.habit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.greyDark,
          padding: AppPadding.v10h20,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  FadeInImage.assetNetwork(
                    imageErrorBuilder: (context, object, stackTrace) {
                      return Image.asset(
                        'assets/images/habit.png',
                        width: 95,
                        height: 95,
                      );
                    },
                    placeholder: 'assets/images/loadImage.png',
                    image:
                        'https://proprikol.ru/wp-content/uploads/2022/10/kartinki-s-mezhdunarodnym-dnem-gor-16-scaled.jpg',
                    width: 95,
                    height: 95,
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              habit.name,
                              style: AppTextStyle.medium20,
                            ),
                            Container(
                              padding: AppPadding.horizontal16,
                              color: AppColors.redShade100,
                              child: const Text(
                                'зависимость',
                                style: AppTextStyle.medium14,
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Повторов: ${habit.repeatsDay}',
                              style: AppTextStyle.medium14,
                            ),
                            Text(
                              'Выполнено: ${habit.repeatsDay}',
                              style: AppTextStyle.medium14,
                            ),
                          ],
                        ),
                        const Text(
                          'Прогресс привычки',
                          style: AppTextStyle.medium14,
                        ),
                        Container(
                          padding: AppPadding.top8,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 10,
                                color: AppColors.grey,
                              ),
                              Container(
                                width: 200,
                                height: 10,
                                color: AppColors.orange,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: AppPadding.top18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    7,
                    (index) => Padding(
                      padding: AppPadding.horizontal8,
                      child: Container(
                        padding: AppPadding.all8,
                        decoration: BoxDecoration(
                          color: index == 0 ? AppColors.orange : AppColors.grey,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          AppConst.weekList[index],
                          style: AppTextStyle.mediumBlack14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: AppPadding.all8,
            alignment: Alignment.center,
            width: double.infinity,
            color: AppColors.orange,
            child: const Text(
              'Отметить привычку',
              style: AppTextStyle.mediumBlack20,
            ),
          ),
        ),
      ],
    );
  }
}
