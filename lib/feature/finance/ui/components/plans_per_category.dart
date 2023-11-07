import 'package:finplan/feature/finance/domain/plan_entity/plan_entity.dart';
import 'package:flutter/material.dart';
import '../../../../app/ui/components/app_plan_dialog.dart';
import '../../../../app/ui/theme/app_colors.dart';
import '../../../../app/ui/theme/app_text_style.dart';
import '../../../../app/ui/theme/consts.dart';

class PlansPerCategory extends StatelessWidget {
  final String name;
  final List<PlanEntity> listPlans;

  const PlansPerCategory({
    super.key,
    required this.name,
    required this.listPlans,
  });

  @override
  Widget build(BuildContext context) {
    int sumPlan = 0;
    int sumValue = 0;

    // TODO: убрать расчеты в cubit или usecase
    for (var element in listPlans) {
      sumPlan += element.sum;
    }

    return Column(
      children: [
        Container(
          padding: AppPadding.v10h20,
          color: AppColors.greyDark,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  name,
                  style: AppTextStyle.medium14,
                ),
              ),
              const Expanded(
                child: Text(
                  '%',
                  style: AppTextStyle.medium14,
                ),
              ),
              Expanded(
                child: Text(
                  '+$sumPlan',
                  style: AppTextStyle.boldGreen14,
                ),
              ),
              Expanded(
                child: Text(
                  '-$sumValue',
                  style: AppTextStyle.boldRed14,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: List.generate(listPlans.length, (index) {
            final percent = (listPlans[index].sum - (listPlans[index].forecast ?? 0))/ listPlans[index].sum;

            return Column(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AppPlanDialog(
                        planEntity: listPlans[index],
                      ),
                    );
                  },
                  child: Container(
                    padding: AppPadding.all16,
                    color: AppColors.grey,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            listPlans[index].category,
                            style: AppTextStyle.mediumBlack20,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${percent.toStringAsFixed(0)} %',
                            style: percent < 0 ? AppTextStyle.mediumRed20 : AppTextStyle.mediumGreen20,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${listPlans[index].sum}',
                            style: AppTextStyle.mediumBlack20,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${listPlans[index].forecast}',
                            style: AppTextStyle.mediumBlack20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: index == listPlans.length ? false : true,
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
