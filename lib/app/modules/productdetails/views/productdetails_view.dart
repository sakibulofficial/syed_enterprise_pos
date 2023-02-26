import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/base_view.dart';
import 'package:syed_enterprise_pos/app/core/values/app_values.dart';
import 'package:syed_enterprise_pos/app/core/values/text_styles.dart';
import 'package:syed_enterprise_pos/app/core/widget/custom_app_bar.dart';
import 'package:syed_enterprise_pos/app/modules/productdetails/views/update_product_view.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widget/primary_button.dart';
import '../controllers/productdetails_controller.dart';

class ProductdetailsView extends BaseView<ProductdetailsController> {
  ProductdetailsView({
    super.key,
  });

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Product Details',
      appBarTitleStyle: appBarTextStyle,
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(
        top: AppValues.largePadding,
        bottom: AppValues.padding,
      ),
      child: _getBody(context),
    );
  }

  Widget _getBody(context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.only(
                        left: AppValues.margin, top: AppValues.margin),
                    padding: const EdgeInsets.all(AppValues.padding),
                    decoration: const BoxDecoration(
                      color: AppColors.imageColor,
                    ),
                    child: const Image(
                      image: AssetImage('assets/images/alt_image.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppValues.padding),
                    child: Text(
                      controller.product.title!,
                      style: productDetailsTitleTextStyle,
                    ),
                  ),
                  _getDetails(
                    'Selling Price',
                    controller.product.sellingPrice.toString(),
                  ),
                  _getDetails(
                    'Unit',
                    controller.product.unit.toString(),
                  ),
                  _getDetails(
                    'Buying Cost',
                    controller.product.buyingPrice.toString(),
                  ),
                  _getDetails(
                    'Stock Count',
                    controller.product.stockCount.toString(),
                  ),
                  _getDetails(
                    'Stock Value',
                    controller.stockValue().toString(),
                  ),
                ],
              ),
            ),
          ),
          PrimaryButton(
            onTap: () => Get.to(
              UpdateProductView(),
            ),
            buttonText: 'Update Product',
          ),
        ],
      ),
    );
  }

  Widget _getDetails(String title, String data) {
    return Container(
      padding: const EdgeInsets.only(
        top: AppValues.padding,
        bottom: AppValues.padding,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: AppColors.borderColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: AppValues.padding,
          left: AppValues.padding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(data),
          ],
        ),
      ),
    );
  }
}
