import 'package:flutter/material.dart';

import '../../../../app/ui/theme/app_colors.dart';
import '../../../../app/ui/theme/app_text_style.dart';

class CustomTextButton extends StatelessWidget {
  final bool isSelected;
  final String name;
  final Function() onTap;

  const CustomTextButton({
    super.key,
    required this.isSelected,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: isSelected
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
