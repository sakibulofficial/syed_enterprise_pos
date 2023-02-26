import 'package:flutter/material.dart';
import 'package:syed_enterprise_pos/app/core/values/app_values.dart';
import 'package:syed_enterprise_pos/app/core/widget/primary_button.dart';
import 'package:syed_enterprise_pos/app/modules/expance/widgets/textfield_widget.dart';
import '../../../core/base/base_view.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../controllers/expance_controller.dart';

class AddExpanceView extends BaseView<ExpanceController> {
  AddExpanceView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Add Expance',
      appBarTitleStyle: appBarTextStyle,
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return _getBody(context);
  }

  _getBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            CustomTextField(
              title: 'Expance Title',
              controller: controller.titleController,
            ),
            CustomTextField(
              title: 'Expance Amount',
              controller: controller.amountController,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: AppValues.padding),
          child: PrimaryButton(
            onTap: () => controller.createExpance(),
            buttonText: 'Add Expance',
          ),
        ),
      ],
    );
  }
}
