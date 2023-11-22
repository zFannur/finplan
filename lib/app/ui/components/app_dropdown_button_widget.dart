import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class AppDropdownButtonWidget<T> extends StatelessWidget {
  final T value;
  final Function(T? value) onChanged;
  final List<DropdownMenuItem<T>> items;

  const AppDropdownButtonWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      //isExpanded: true,
      iconSize: 24,
      alignment: Alignment.center,
      value: value,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: AppColors.orange,
      ),
      elevation: 16,
      style: AppTextStyle.bold14,
      dropdownColor: AppColors.greyDark,
      underline: Container(
        width: double.infinity,
        height: 2,
        color: AppColors.orange,
      ),
      onChanged: onChanged,
      items: items,
    );
  }
}