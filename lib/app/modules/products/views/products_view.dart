import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/base_view.dart';
import 'package:syed_enterprise_pos/app/core/widget/custom_app_bar.dart';
import 'package:syed_enterprise_pos/app/core/widget/primary_button.dart';
import 'package:syed_enterprise_pos/app/routes/app_pages.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/product_card.dart';
import '../controllers/products_controller.dart';

class ProductsView extends BaseView<ProductsController> {
  ProductsView({
    super.key,
  });

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Product List',
      appBarTitleStyle: appBarTextStyle,
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 164,
            child: Obx(() => ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) => ProductCard(
                    product: controller.productList[index],
                  ),
                )),
          ),
          PrimaryButton(
            onTap: () => Get.toNamed(
              Routes.CREATE_PRODUCT,
              arguments: Get.arguments,
            ),
            buttonText: 'Add Product',
          ),
        ],
      ),
    );
  }
}
