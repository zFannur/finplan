import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/domain/state/categories/categories_cubit.dart';
import '../../../../app/router/app_router.dart';
import '../../../../app/ui/theme/app_colors.dart';
import '../../../../app/ui/theme/app_text_style.dart';
import '../../../../app/ui/theme/consts.dart';
import '../../domain/entities/operation_entity/operation_entity.dart';
import '../bloc/operation_cubit/operation_cubit.dart';

class OperationsPerDay extends StatelessWidget {
  final DateTime date;
  final List<OperationEntity> listOperations;

  const OperationsPerDay({
    super.key,
    required this.date,
    required this.listOperations,
  });

  @override
  Widget build(BuildContext context) {
    int sumExpense = 0;
    int sumIncome = 0;
    // TODO: убрать расчеты в cubit или usecase
    for (var element in listOperations) {
      if (element.type == TypeOperation.expense) {
        sumExpense += element.sum;
      } else {
        sumIncome += element.sum;
      }
    }
    return Column(
      children: [
        Container(
          padding: AppPadding.v10h20,
          color: AppColors.greyDark,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    '${date.day}',
                    style: AppTextStyle.bold24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${date.month}.${date.year}  ${date.getWeekDayString()}',
                    style: AppTextStyle.medium14,
                  ),
                ],
              ),
              Text(
                '+$sumIncome',
                style: AppTextStyle.boldGreen14,
              ),
              Text(
                '-$sumExpense',
                style: AppTextStyle.boldRed14,
              ),
            ],
          ),
        ),
        Column(
          children: List.generate(listOperations.length, (index) {
            final TextStyle style14 =
                listOperations[index].type == TypeOperation.expense
                    ? AppTextStyle.mediumRed14
                    : AppTextStyle.mediumGreen14;

            final TextStyle style20 =
                listOperations[index].type == TypeOperation.expense
                    ? AppTextStyle.mediumRed20
                    : AppTextStyle.mediumGreen20;
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    context.pushRoute(
                      OperationDetailRoute(
                        operation: listOperations[index],
                        buttonIcon: Icons.edit,
                        onTap: (operationEntity) {
                          context
                              .read<OperationCubit>()
                              .editOperation(operationEntity);

                          context.read<CategoriesCubit>().add(
                                category: operationEntity.category,
                                underCategory: operationEntity.underCategory,
                                note: operationEntity.note,
                              );
                          context.popRoute();
                        },
                        title: 'Редактирование',
                      ),
                    );
                  },
                  child: Container(
                    padding: AppPadding.all8,
                    color: listOperations[index].type == TypeOperation.expense
                        ? AppColors.redShade100
                        : AppColors.greenShade100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text(
                                listOperations[index].underCategory,
                                style: style14,
                              ),
                              Visibility(
                                visible: listOperations[index].note.isNotEmpty,
                                child: Text(
                                  listOperations[index].note,
                                  style: style14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            listOperations[index].category,
                            style: style20,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${listOperations[index].sum}',
                            style: style20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: index == listOperations.length ? false : true,
                  child: const Divider(height: 1, color: AppColors.black),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}

extension DateTimeExtension on DateTime {
  String getWeekDayString() {
    switch (weekday) {
      case 1:
        return 'Пн';
      case 2:
        return 'Вт';
      case 3:
        return 'Ср';
      case 4:
        return 'Чт';
      case 5:
        return 'Пт';
      case 6:
        return 'Сб';
      case 7:
        return 'Вс';
      default:
        return 'Ошибка';
    }
  }
}
