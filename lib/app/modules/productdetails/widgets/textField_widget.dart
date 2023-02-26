// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  const TextFieldWidget({
    super.key,
    required this.title,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: AppValues.padding_4,
        bottom: AppValues.padding_4,
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
            controller: controller,
            keyboardType: keyboardType,
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
          )
        ],
      ),
    );
  }
}
