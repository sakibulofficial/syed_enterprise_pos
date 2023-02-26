import 'package:flutter/material.dart';

import '/app/core/values/app_colors.dart';
import '/app/core/widget/app_bar_title.dart';

//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String appBarTitleText;
  final List<Widget>? actions;
  final bool centerTitle;
  final TextStyle appBarTitleStyle;

  CustomAppBar({
    Key? key,
    required this.appBarTitleText,
    this.actions,
    this.centerTitle = false,
    required this.appBarTitleStyle,
  }) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarColor,
      centerTitle: centerTitle,
      elevation: 2,
      actions: actions,
      iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
      title: AppBarTitle(
        text: appBarTitleText,
        pageTitleStyle: appBarTitleStyle,
      ),
    );
  }
}
