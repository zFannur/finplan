import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

final mainThemeData = ThemeData(
  fontFamily: 'Inter',
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    secondary: AppColors.orange,
    background: AppColors.black,
  ),
  scaffoldBackgroundColor: AppColors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.greyDark,
    titleTextStyle: AppTextStyle.bold24,
  )
);
