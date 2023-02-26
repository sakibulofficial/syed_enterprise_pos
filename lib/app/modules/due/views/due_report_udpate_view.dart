// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syed_enterprise_pos/app/core/base/base_view.dart';
import 'package:syed_enterprise_pos/app/core/values/text_styles.dart';
import 'package:syed_enterprise_pos/app/core/widget/custom_app_bar.dart';
import 'package:syed_enterprise_pos/app/modules/due/controllers/due_controller.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../widgets/report_card_due.dart';

class DueReportUpdate extends BaseView<DueController> {
  DueReportUpdate({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Update Report',
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              customerDetialsWidget(context),
              totalWidget(context),
              // updateDiscount(context),
              getIsPaidButton(context),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppValues.padding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                reportButton(
                  'Delete Report',
                  () => controller.deleteReport(controller.dueReport.id!),
                  context,
                  Colors.red,
                ),
                reportButton(
                  'Update Report',
                  () => controller.getUpdateReport(),
                  context,
                  AppColors.colorPrimary,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  reportButton(String buttonText, VoidCallback onTap, BuildContext context,
      backgroundColor) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(
            right: AppValues.margin,
            left: AppValues.margin,
          ),
          padding: const EdgeInsets.only(
            top: AppValues.padding,
            bottom: AppValues.padding,
          ),
          height: 54,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
              AppValues.radius_10,
            ),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: buttonTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  customerDetialsWidget(context) {
    return Container(
      padding: const EdgeInsets.all(AppValues.padding),
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        boxShadow: [
          BoxShadow(
            color: AppColors.textColorSecondary.withOpacity(.5),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppValues.padding_4),
            child: Text(
              "Name : ${controller.dueReport.customerName!}",
              style: reportSubTitleOneTextStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppValues.padding_4),
                child: Text(
                  "Number : ${controller.dueReport.customerNumber!}",
                  style: reportSubTitleOneTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppValues.padding_4),
                child: Text(
                  "Date : ${controller.getFormatedDate(controller.dueReport.buyingDate!)}",
                  style: reportSubTitleOneTextStyle,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppValues.padding_4),
            child: Text(
              "Address : ${controller.dueReport.customerAddress!}",
              style: reportSubTitleOneTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  totalWidget(context) {
    return Container(
      padding: const EdgeInsets.all(AppValues.padding),
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        boxShadow: [
          BoxShadow(
            color: AppColors.textColorSecondary.withOpacity(.5),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppValues.padding_4),
            decoration: BoxDecoration(
                border: Border.all(
              color: AppColors.borderColorBlack,
              width: 1,
            )),
            child: Column(
              children: [
                getAmount('Total : ', controller.dueReport.subTotal.toString()),
                getAmount(
                    "Discunt : ", controller.dueReport.discount!.toString()),
                getAmount(
                    "Net total: ", controller.dueReport.total!.toString()),
                getAmount("Paid : ", controller.dueReport.paid.toString()),
                getAmount("Due : ", controller.dueReport.due.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getAmount(String title, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppValues.padding_4),
          child: Text(
            title,
            style: reportSubTitleOneTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppValues.padding_4),
          child: Text(
            amount,
            style: reportSubTitleOneTextStyle,
          ),
        ),
      ],
    );
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
          itemBuilder: (context, index) => ReportCardDue(
            product: controller.cartList[index],
          ),
        ));
  }
}
