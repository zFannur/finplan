import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:finplan/app/ui/theme/consts.dart';
import 'package:flutter/material.dart';

import '../../../app/ui/components/app_bar.dart';
import '../../../app/ui/theme/app_colors.dart';
import 'components/operation_builder.dart';

class Scene1 extends StatelessWidget {
  const Scene1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(name: 'Операции'),
      body: Column(
        children: [
          Padding(
            padding: AppPadding.top18,
            child: Container(
              padding: AppPadding.all16,
              color: AppColors.greyDark,
              child: Column(
                children: [
                  Text(
                    'Общая сумма',
                    style: AppTextStyle.bold14,
                  ),
                  Text(
                    '1 000 000 000 р',
                    style: AppTextStyle.bold24,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: AppPadding.top18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: AppPadding.v10h40,
                    color: AppColors.greyDark,
                    child: const Text(
                      'Расход',
                      style: AppTextStyle.boldRed14,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: AppPadding.v10h40,
                    color: AppColors.greyDark,
                    child: const Text(
                      'Доход',
                      style: AppTextStyle.boldGreen14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: AppPadding.top18,
            child: OperationsBuilder(),
          ),
        ],
      ),
    );
  }
}
