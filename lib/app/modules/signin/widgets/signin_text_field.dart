import 'package:flutter/material.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';

class SignInTextField extends StatelessWidget {
  final String hint;
  final Icon icon;
  final TextEditingController textEditingController;
  const SignInTextField({
    super.key,
    required this.hint,
    required this.icon,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppValues.padding),
      child: TextField(
        controller: textEditingController,
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
            ),
          ),
        ),
      ),
    );
  }
}
