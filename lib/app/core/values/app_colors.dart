import 'package:flutter/material.dart';

Map<int, Color> colorSwatch = {
  50: const Color.fromRGBO(38, 204, 215, .1),
  100: const Color.fromRGBO(38, 204, 215, .2),
  200: const Color.fromRGBO(38, 204, 215, .3),
  300: const Color.fromRGBO(38, 204, 215, .4),
  400: const Color.fromRGBO(38, 204, 215, .5),
  500: const Color.fromRGBO(38, 204, 215, .6),
  600: const Color.fromRGBO(38, 204, 215, .7),
  700: const Color.fromRGBO(38, 204, 215, .8),
  800: const Color.fromRGBO(38, 204, 215, .9),
  900: const Color.fromRGBO(38, 204, 215, 1),
};

abstract class AppColors {
  static const Color pageBackground = Color(0xFFFFFFFF);
  static const Color statusBarColor = Color(0xFFF6F7FF);
  static const Color appBarColor = Color(0xFFFFFFFF);
  static const Color bottomBarColor = Color(0xFF26CCD7);
  static const Color appBarIconColor = Color(0xFF000000);
  static const Color appBarTextColor = Color(0xFF26CCD7);
  static const Color textFieldBorderColor = Color(0xFF26CCD7);
  static const Color totalSummeryColorOne = Color(0xFFA1EDE5);
  static const Color totalSummeryColorTwo = Color(0xFFB0F4E6);

  static MaterialColor colorPrimarySwatch =
      MaterialColor(0xFF0E7CDB, colorSwatch);
  static const Color colorPrimary = Color(0xFF26CCD7);
  static const Color secondaryColorPrimary = Color(0xFFA1EDE5);
  static const Color colorAccent = Color(0xFF26CCD7);
  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color lightGreyColor = Color(0xFFC4C4C4);
  static const Color errorColor = Color(0xFFFF0101);
  static const Color buttonBgColor = colorPrimary;
  static const Color defaultRippleColor = Color(0x0338686A);
  static const Color textColorPrimary = Color(0xFF000000);
  static const Color textColorSecondary = Color(0xFFA1A1A1);
  static const Color textColorthird = Color(0xFFA8A8A8);
  static const Color imageColor = Color(0xFFEEEEEE);
  static const Color paidColor = Color(0xFF57D48E);
  static const Color nonPaidColor = Color(0xFFFF725E);
  static const Color borderColor = Color(0xFFEEEEEE);
  static const Color textColorTag = colorPrimary;
  static const Color textColorWhite = Color(0xFFFFFFFF);
  static Color searchFieldTextColor = const Color(0xFF323232).withOpacity(0.5);
  static const Color iconColorDefault = Color(0xFFC8C8C8);
  static const Color iconColorSelected = colorPrimary;
  static const Color switchActiveColor = colorPrimary;
  static const Color borderColorBlack = Color(0xFF000000);
  static const Color borderColorDefault = colorPrimary;
  static const Color hintColor = Color(0xFFC8C8C8);
}
