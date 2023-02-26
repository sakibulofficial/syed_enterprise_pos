import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String text;
  final TextStyle pageTitleStyle;

  const AppBarTitle({
    Key? key,
    required this.text,
    required this.pageTitleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: pageTitleStyle,
      textAlign: TextAlign.center,
    );
  }
}
