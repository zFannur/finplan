import 'package:finplan/app/ui/theme/app_colors.dart';
import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:finplan/app/ui/theme/consts.dart';
import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Загрузка...',
            style: AppTextStyle.bold24,
          ),
          Padding(
            padding: AppPadding.top8,
            child: CircularProgressIndicator(
              color: AppColors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
