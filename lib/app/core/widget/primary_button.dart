import 'package:flutter/material.dart';

import '../values/app_colors.dart';
import '../values/app_values.dart';
import '../values/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          right: AppValues.margin,
          left: AppValues.margin,
        ),
        padding: const EdgeInsets.only(
          top: AppValues.padding,
          bottom: AppValues.padding,
        ),
        width: MediaQuery.of(context).size.width,
        height: 54,
        decoration: BoxDecoration(
          color: AppColors.bottomBarColor,
          borderRadius: BorderRadius.circular(
            AppValues.radius_10,
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
