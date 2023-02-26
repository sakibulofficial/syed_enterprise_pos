import 'package:flutter/material.dart';
import '../values/app_values.dart';

class SpacerWidget extends StatelessWidget {
  const SpacerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: AppValues.largePadding,
    );
  }
}
