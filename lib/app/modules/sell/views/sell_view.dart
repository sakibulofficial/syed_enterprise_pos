import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/base_view.dart';
import 'package:syed_enterprise_pos/app/core/values/text_styles.dart';
import 'package:syed_enterprise_pos/app/core/widget/custom_app_bar.dart';
import 'package:syed_enterprise_pos/app/modules/sell/widgets/sells_product_card.dart';

import '../../../core/model/products_model.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widget/primary_button.dart';
import '../controllers/sell_controller.dart';
import 'confim_order_view.dart';

class SellView extends BaseView<SellController> {
  SellView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Select Products',
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
                  itemBuilder: (context, index) => SellsProductCard(
                      productListModel: controller.productList[index],
                      color: controller.productList[index].isSelected == false
                          ? AppColors.colorWhite
                          : AppColors.colorPrimary,
                      onTap: () {
                        debugPrint(
                          controller.productList[index].isSelected.toString(),
                        );
                        controller.productList[index] = ProductModel(
                          id: controller.productList[index].id,
                          title: controller.productList[index].title,
                          isSelected: controller.productList[index].isSelected =
                              true,
                          uId: controller.productList[index].uId,
                          sellingPrice:
                              controller.productList[index].sellingPrice,
                          buyingPrice:
                              controller.productList[index].buyingPrice,
                          stockCount: controller.productList[index].stockCount,
                          stockValue: controller.productList[index].stockValue,
                          unit: controller.productList[index].unit,
                        );
                        controller.addToCart(controller.productList[index]);
                        controller.productList[index].isSelected = true;
                      }),
                )),
          ),
          PrimaryButton(
            onTap: () {
              if (controller.cartList.isNotEmpty) {
                Get.to(() => ConfirmOrderView());
              }
            },
            // onTap: () => controller.updateProduct(),

            buttonText: 'Plase Order',
          ),
        ],
      ),
    );
  }
}
