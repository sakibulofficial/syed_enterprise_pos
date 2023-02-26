import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/values/app_colors.dart';
import 'package:syed_enterprise_pos/app/core/values/app_values.dart';
import 'package:syed_enterprise_pos/app/core/values/text_styles.dart';
import 'package:syed_enterprise_pos/app/core/widget/custom_app_bar.dart';
import 'package:syed_enterprise_pos/app/modules/report/controllers/report_controller.dart';
import '../../../core/base/base_view.dart';

class ReportDetails extends BaseView<ReportController> {
  ReportDetails({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Report Details',
      appBarTitleStyle: appBarTextStyle,
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height - 150,
        width: MediaQuery.of(context).size.width - 32,
        decoration: const BoxDecoration(
          color: AppColors.colorWhite,
          boxShadow: [
            BoxShadow(
              color: AppColors.textColorSecondary,
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppValues.smallPadding),
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      const BoxDecoration(color: AppColors.colorPrimary),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Syed Enterprise',
                        style: reportTitleTextStyle,
                      ),
                      Text(
                        'Address : Sagordi Barishal',
                        style: reportSubTitleOneTextStyle,
                      ),
                      Text(
                        'phone : +880 1711-035496 ',
                        style: reportSubTitleOneTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppValues.smallPadding,
                  ),
                  child: Text(
                    'CASH RECIPET',
                    style: reportTitleOneTextStyle,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppValues.padding_4),
                      child: Text(
                        "Name : ${controller.customerDetails.customerName!}",
                        style: reportSubTitleOneTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(AppValues.padding_4),
                          child: Text(
                            "Number : ${controller.customerDetails.customerNumber!}",
                            style: reportSubTitleOneTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppValues.padding_4),
                          child: Text(
                            "Date : ${controller.getFormatedDate(controller.customerDetails.buyingDate!)}",
                            style: reportSubTitleOneTextStyle,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppValues.padding_4),
                      child: Text(
                        "Address : ${controller.customerDetails.customerAddress!}",
                        style: reportSubTitleOneTextStyle,
                      ),
                    ),
                  ],
                ),
                getProductdetails(context),
              ],
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  getTotalWidget(),
                  Padding(
                    padding: const EdgeInsets.all(AppValues.padding),
                    child: Text(
                      'Signature',
                      style: tableTitleTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getTotalWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
      child: Column(
        children: [
          getTotalText(
            'Subtotal',
            controller.customerDetails.subTotal.toString(),
          ),
          getTotalText(
            'Due',
            '0.0',
          ),
          getTotalText(
            'Discount',
            controller.customerDetails.discount.toString(),
          ),
          getTotalText(
            'Total',
            controller.customerDetails.total.toString(),
          )
        ],
      ),
    );
  }

  getTotalText(String title, String data) {
    return Container(
      padding: const EdgeInsets.all(AppValues.padding_4),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.borderColorBlack,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: tableTitleTextStyle,
          ),
          Text(
            data,
            style: tableTitleTextStyle,
          )
        ],
      ),
    );
  }

  getProductdetails(context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(AppValues.padding),
          child: Column(
            children: [
              Table(
                border: TableBorder.all(
                  color: AppColors.borderColorBlack,
                  width: 1,
                ),
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                  5: FlexColumnWidth(2),
                },
                children: [
                  TableRow(children: [
                    controller.getTableTitle('No'),
                    controller.getTableTitle('Description'),
                    controller.getTableTitle('Quantity'),
                    controller.getTableTitle('Unit'),
                    controller.getTableTitle('Rate'),
                    controller.getTableTitle('Total'),
                  ])
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 550,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) => Table(
                    border: TableBorder.all(
                      color: AppColors.borderColorBlack,
                      width: 1,
                    ),
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(4),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(1),
                      4: FlexColumnWidth(1),
                      5: FlexColumnWidth(2),
                    },
                    children: [
                      TableRow(children: [
                        controller.getTableTitle('${index + 1}'),
                        controller.getTableTitle(
                            controller.productList[index].title.toString()),
                        controller.getTableTitle(controller
                            .productList[index].stockCount
                            .toString()),
                        controller.getTableTitle(
                            controller.productList[index].unit.toString()),
                        controller.getTableTitle(controller
                            .productList[index].sellingPrice
                            .toString()),
                        controller.getTableTitle(controller
                            .productList[index].stockValue
                            .toString()),
                      ])
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
