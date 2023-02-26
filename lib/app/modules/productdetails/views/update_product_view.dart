import 'package:flutter/material.dart';
import 'package:syed_enterprise_pos/app/core/base/base_view.dart';
import 'package:syed_enterprise_pos/app/core/values/text_styles.dart';
import 'package:syed_enterprise_pos/app/core/widget/custom_app_bar.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/primary_button.dart';
import '../controllers/productdetails_controller.dart';
import '../widgets/textField_widget.dart';

class UpdateProductView extends BaseView<ProductdetailsController> {
  UpdateProductView({
    super.key,
  });

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
        appBarTitleText: 'Update Product', appBarTitleStyle: appBarTextStyle);
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: AppValues.padding,
        bottom: AppValues.padding,
      ),
      child: _getBody(context),
    );
  }

  Widget _getBody(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppValues.padding,
                right: AppValues.padding,
              ),
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: controller.productNameController,
                    keyboardType: TextInputType.text,
                    title: 'Product Name',
                  ),
                  TextFieldWidget(
                    controller: controller.buyingPriceController,
                    title: 'Buying Price',
                    keyboardType: TextInputType.number,
                  ),
                  TextFieldWidget(
                    controller: controller.sellingPriceController,
                    title: 'Selling Price',
                    keyboardType: TextInputType.number,
                  ),
                  TextFieldWidget(
                    controller: controller.currentStockController,
                    title: 'Current Stock',
                    keyboardType: TextInputType.number,
                  ),
                  TextFieldWidget(
                    controller: controller.productUnitController,
                    title: 'Product Unit',
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
          ),
        ),
        PrimaryButton(
            onTap: () {
              controller.updateProduct();
            },
            buttonText: 'Update Product')
      ],
    );
  }
}
