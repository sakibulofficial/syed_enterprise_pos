import 'package:flutter/material.dart';
import 'package:syed_enterprise_pos/app/core/values/app_values.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';

class SignUpTextField extends StatelessWidget {
  final String hint;
  final Icon icon;
  final TextEditingController controller;
  const SignUpTextField({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: AppValues.padding,
        left: AppValues.padding,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: icon,
            prefixIconColor: AppColors.iconColorDefault,
            filled: true,
            fillColor: AppColors.colorWhite,
            hintText: hint,
            hintStyle: hintTextStyle,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.textFieldBorderColor,
              ), //<-- SEE HERE
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.textFieldBorderColor,
              ), //<-- SEE HERE
            )),
      ),
    );
  }
}
