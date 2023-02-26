// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/base_view.dart';
import 'package:syed_enterprise_pos/app/core/values/app_colors.dart';
import 'package:syed_enterprise_pos/app/core/values/app_values.dart';
import 'package:syed_enterprise_pos/app/core/values/text_styles.dart';
import 'package:syed_enterprise_pos/app/core/widget/custom_app_bar.dart';
import 'package:syed_enterprise_pos/app/core/widget/primary_button.dart';
import '../controllers/expance_controller.dart';
import 'add_expance.dart';

class ExpanceView extends BaseView<ExpanceController> {
  ExpanceView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Expance',
      appBarTitleStyle: appBarTextStyle,
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return _getBody(context);
  }

  _getBody(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(AppValues.padding),
              width: MediaQuery.of(context).size.width - 35,
              height: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                color: AppColors.colorPrimary,
                borderRadius: BorderRadius.circular(AppValues.radius_10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      getButton(
                        controller.buttons[0].title,
                        () {
                          controller.isSelected.value = 0;
                        },
                        context,
                        controller.isSelected.value == 0
                            ? AppColors.colorWhite
                            : AppColors.colorPrimary,
                      ),
                      getButton(
                        controller.buttons[1].title,
                        () {
                          controller.isSelected.value = 1;
                        },
                        context,
                        controller.isSelected.value == 1
                            ? AppColors.colorWhite
                            : AppColors.colorPrimary,
                      ),
                      getButton(
                        controller.buttons[2].title,
                        () {
                          controller.isSelected.value = 2;
                        },
                        context,
                        controller.isSelected.value == 2
                            ? AppColors.colorWhite
                            : AppColors.colorPrimary,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${controller.getTotal()} tk',
                  ),
                ],
              ),
            ),
            Expanded(
              child: _getExpances(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: AppValues.padding),
              child: PrimaryButton(
                onTap: () => Get.to(AddExpanceView()),
                buttonText: 'Add Expance',
              ),
            )
          ],
        ));
  }

  _getExpances() {
    if (controller.isSelected == 0) {
      return controller.expances.isEmpty
          ? Center(
              child: Text(
                'No Expances added',
                style: highlightTextStyleNoData,
              ),
            )
          : ListView.builder(
              itemCount: controller.expances.length,
              itemBuilder: (context, index) {
                DateTime dateTime =
                    DateTime.parse(controller.expances[index].date!);
                return DateTime.now().day == dateTime.day &&
                        DateTime.now().month == dateTime.month &&
                        DateTime.now().year == dateTime.year
                    ? getExpanceCard(
                        controller.expances[index].title!,
                        controller.expances[index].amount.toString(),
                        controller.expances[index].date.toString(),
                      )
                    : Container();
              },
            );
    } else if (controller.isSelected == 1) {
      return controller.expances.isEmpty
          ? Center(
              child: Text(
                'No Expances added',
                style: highlightTextStyleNoData,
              ),
            )
          : ListView.builder(
              itemCount: controller.expances.length,
              itemBuilder: (context, index) {
                DateTime dateTime =
                    DateTime.parse(controller.expances[index].date!);
                return DateTime.now().month == dateTime.month &&
                        DateTime.now().year == dateTime.year
                    ? getExpanceCard(
                        controller.expances[index].title!,
                        controller.expances[index].amount.toString(),
                        controller.expances[index].date.toString(),
                      )
                    : Container();
              },
            );
    } else if (controller.isSelected == 2) {
      return controller.expances.isEmpty
          ? Center(
              child: Text(
                'No Expances added',
                style: highlightTextStyleNoData,
              ),
            )
          : ListView.builder(
              itemCount: controller.expances.length,
              itemBuilder: (context, index) {
                DateTime dateTime =
                    DateTime.parse(controller.expances[index].date!);
                return DateTime.now().year == dateTime.year
                    ? getExpanceCard(
                        controller.expances[index].title!,
                        controller.expances[index].amount.toString(),
                        controller.expances[index].date.toString(),
                      )
                    : Container();
              },
            );
    }
  }

  getExpanceCard(String title, String amount, String date) {
    return Container(
      margin: const EdgeInsets.all(AppValues.margin),
      padding: const EdgeInsets.all(AppValues.smallPadding),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(AppValues.radius_10),
        boxShadow: const [
          BoxShadow(
            color: AppColors.iconColorDefault,
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppValues.smallPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppValues.radius_10),
                  color: AppColors.colorPrimary.withOpacity(.3),
                ),
                child: const Image(
                  height: 36,
                  image: AssetImage('assets/icons/expense.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppValues.smallPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: AppValues.padding_4),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: AppValues.padding_4),
                        child: Text(
                          title,
                          style: cardTitleTextStyle,
                        ),
                      ),
                    ),
                    Text(
                      amount,
                      style: cardSubTitleTextStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
          Text(
            controller.getFormatedDate(date),
            style: cardSubTitleTextStyle,
          ),
        ],
      ),
    );
  }

  getButton(String title, VoidCallback onTap, context, Color color) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 6 - 36,
          vertical: AppValues.padding,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppValues.radius_10,
            ),
            color: color,
            border: Border.all(
              color: AppColors.colorWhite,
            )),
        child: Text(title),
      ),
    );
  }
}
