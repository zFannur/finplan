import 'package:flutter/material.dart';

import '../../../../app/ui/theme/app_colors.dart';
import '../../../../app/ui/theme/app_text_style.dart';
import 'operation_builder.dart';

class CustomTextButton extends StatelessWidget {
  final PageType currentPage;
  final PageType selectedPage;
  final String name;
  final Function() onTap;

  const CustomTextButton({
    super.key,
    required this.currentPage,
    required this.selectedPage,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: currentPage == selectedPage
          ? TextButton.styleFrom(
              side: const BorderSide(
                width: 2.0,
                color: AppColors.orange,
              ),
            )
          : null,
      onPressed: onTap,
      child: Text(
        name,
        style: AppTextStyle.bold14,
      ),
    );
  }
}
