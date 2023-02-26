import 'package:flutter/material.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextInputType keyboardType;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: AppValues.padding,
        right: AppValues.padding,
        top: AppValues.smallPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppValues.padding_4,
            ),
            child: Text(
              title,
              style: textFieldTitleTextStyle,
            ),
          ),
          TextField(
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.colorWhite,
                hintText: title,
                hintStyle: hintTextStyle,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppValues.radius),
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.textFieldBorderColor,
                  ), //<-- SEE HERE
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppValues.radius),
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.textFieldBorderColor,
                  ), //<-- SEE HERE
                )),
          ),
        ],
      ),
    );
  }
}
