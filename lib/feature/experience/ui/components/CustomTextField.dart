import 'package:flutter/material.dart';

import '../../../../app/ui/components/app_text_field.dart';
import '../../../../app/ui/theme/app_text_style.dart';
import '../../../../app/ui/theme/consts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final String name;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPadding.top8,
          child: Text(
            name,
            style: AppTextStyle.bold24,
          ),
        ),
        AppTextField(
          labelText: labelText,
          controller: controller,
          validator: validator,
        ),
      ],
    );
  }
}
