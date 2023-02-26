// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syed_enterprise_pos/app/core/base/base_view.dart';
import 'package:syed_enterprise_pos/app/core/values/text_styles.dart';
import 'package:syed_enterprise_pos/app/core/widget/custom_app_bar.dart';
import 'package:syed_enterprise_pos/app/core/widget/primary_button.dart';
import 'package:syed_enterprise_pos/app/modules/sell/widgets/customer_text_field.dart';
import 'package:syed_enterprise_pos/app/modules/sell/widgets/product_card_sell.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../controllers/sell_controller.dart';

class ConfirmOrderView extends BaseView<SellController> {
  ConfirmOrderView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Confirm Order',
      appBarTitleStyle: appBarTextStyle,
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return _getBody(context);
  }

  _getBody(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppValues.padding,
            ),
            child: Text(
              'Customer detials',
              style: customerDetialsTextStyle,
            ),
          ),
          Column(
            children: [
              customerDetialsWidget(context),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppValues.padding),
                child: productCardListWidget(context),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: AppValues.padding),
                child: PrimaryButton(
                  onTap: () => controller.getConfirmOrder(),
                  buttonText: 'Confirm Order',
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  customerDetialsWidget(context) {
    return Column(
      children: [
        CustomerTextField(
          controller: controller.customerNameController,
          title: 'Customer Name',
        ),
        CustomerTextField(
          controller: controller.customerNumberController,
          title: 'Customer Number',
        ),
        CustomerTextField(
          controller: controller.customerAddressController,
          title: 'Customer Address',
        ),
        CustomerTextField(
          keyboardType: TextInputType.number,
          controller: controller.customersDiscountController,
          title: 'Discount',
          onChange: (value) {
            controller.discount.value = value == '' ? 0 : int.parse(value!);
            return null;
          },
        ),
        CustomerTextField(
          keyboardType: TextInputType.number,
          controller: controller.customersPaidController,
          title: 'paid',
          onChange: (value) {
            controller.paid.value = value == '' ? 0 : int.parse(value!);
            return null;
          },
        ),
        getIsPaidButton(context),
        getTotal()
      ],
    );
  }

  getTotal() {
    return Obx(() => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppValues.padding),
              margin: const EdgeInsets.all(AppValues.margin),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppValues.radius_10),
                  border: Border.all(
                    width: 1,
                    color: AppColors.colorPrimary,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'due',
                    style: taskTextHeadlineStyle,
                  ),
                  Text(
                    //
                    controller.getTotaldue().toString(),
                    style: taskTextHeadlineStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(AppValues.padding),
              margin: const EdgeInsets.all(AppValues.margin),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppValues.radius_10),
                  border: Border.all(
                    width: 1,
                    color: AppColors.colorPrimary,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'total',
                    style: taskTextHeadlineStyle,
                  ),
                  Text(
                    // controller.getSubtotal().toString(),
                    controller.getTotalAfterDiscount().toString(),
                    style: taskTextHeadlineStyle,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  getIsPaidButton(context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppValues.padding,
          horizontal: AppValues.padding,
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                controller.isPaid.value = !controller.isPaid.value;
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2 - 17,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  vertical: AppValues.padding,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.nonPaidColor),
                  color: controller.isPaid == false
                      ? AppColors.nonPaidColor
                      : AppColors.colorWhite,
                ),
                child: Text(
                  'Due',
                  style: GoogleFonts.inter(
                    color: controller.isPaid == false
                        ? AppColors.colorWhite
                        : AppColors.nonPaidColor,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                controller.isPaid.value = !controller.isPaid.value;
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2 - 17,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  vertical: AppValues.padding,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.paidColor),
                  color: controller.isPaid == true
                      ? AppColors.paidColor
                      : AppColors.colorWhite,
                ),
                child: Text(
                  'Paid',
                  style: GoogleFonts.inter(
                    color: controller.isPaid == true
                        ? AppColors.colorWhite
                        : AppColors.paidColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  productCardListWidget(context) {
    return Obx(() => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.cartList.length,
          itemBuilder: (context, index) => ProductCardSell(
            delete: () => controller.deleteProduct(index),
            product: controller.cartList[index],
            // ignore: body_might_complete_normally_nullable
            onChange: (value) {
              controller.getQuantity(controller.cartList[index], index, value!);
            },
          ),
        ));
  }
}
