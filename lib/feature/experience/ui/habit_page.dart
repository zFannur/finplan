import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/const/app_const.dart';
import 'package:finplan/app/ui/theme/app_colors.dart';
import 'package:finplan/app/ui/theme/app_icons.dart';
import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:finplan/app/ui/theme/consts.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HabitPage extends StatelessWidget {
  const HabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                              const Text(
                                'Пить воду',
                                style: AppTextStyle.medium20,
                              ),
                              Container(
                                padding: AppPadding.horizontal16,
                                color: AppColors.redShade100,
                                child: const Text(
                                  'Цель',
                                  style: AppTextStyle.medium14,
                                ),
                              )
                            ],
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Повторов: 3',
                                style: AppTextStyle.medium14,
                              ),
                              Text(
                                'Выполнено: 1',
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
                            color:
                                index == 0 ? AppColors.orange : AppColors.grey,
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
            onTap: () {

            },
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
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: '1',
        onPressed: () {
          // context.pushRoute(
          //   OperationDetailRoute(
          //     buttonIcon: Icons.add,
          //     onTap: (operationEntity) {
          //       context.read<OperationCubit>().addOperation(operationEntity);
          //       context.read<CategoriesCubit>().add(
          //             name: operationEntity.category,
          //             categoryType: CategoryType.category,
          //           );
          //       context.read<CategoriesCubit>().add(
          //             name: operationEntity.category,
          //             categoryType: CategoryType.underCategory,
          //           );
          //       context.popRoute();
          //     },
          //     title: 'Добавить',
          //   ),
          // );
        },
        child: AppIcons.add,
      ),
    );
  }
}
