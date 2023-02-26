import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/base_view.dart';
import 'package:syed_enterprise_pos/app/core/values/app_colors.dart';
import 'package:syed_enterprise_pos/app/core/values/app_values.dart';
import 'package:syed_enterprise_pos/app/core/widget/custom_app_bar.dart';
import 'package:syed_enterprise_pos/app/modules/dashboard/widgets/dashboard_card.dart';
import '../../../core/values/text_styles.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends BaseView<DashboardController> {
  DashboardView({
    super.key,
  });

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      appBarTitleText: controller.data,
      appBarTitleStyle: appBarTextStyle,
    );
  }

  @override
  Widget body(BuildContext context) {
    return _getBody(context);
  }

  _getBody(context) {
    return Obx(() => Column(
          children: [_getTotalSummery(context)],
        ));
  }

  Widget _getTotalSummery(context) {
    return Padding(
      padding: const EdgeInsets.all(AppValues.padding),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 4,
            decoration: const BoxDecoration(
              color: AppColors.totalSummeryColorOne,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppValues.radius_10),
                topRight: Radius.circular(AppValues.radius_10),
              ),
            ),
            child: _getTotalData(
                'Total Stock', controller.productList.length.toString()),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 4,
            decoration: const BoxDecoration(
              color: AppColors.totalSummeryColorTwo,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppValues.radius_10),
                bottomRight: Radius.circular(AppValues.radius_10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: _getTotalData(
                      'Stock Value', controller.getStockValue().toString()),
                ),
                getDevider(context),
                Expanded(
                  child: _getTotalData(
                    'Low Stock',
                    controller.getlowStock().toString(),
                  ),
                ),
                getDevider(context),
                Expanded(
                  child: _getTotalData(
                      'Total Expense', controller.getTotalExpance().toString()),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: AppValues.padding),
            height: MediaQuery.of(context).size.height -
                ((MediaQuery.of(context).size.width / 4) * 3 + 40),
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (10 / 8),
                  crossAxisCount: 2,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.dashboardCardList.length,
                itemBuilder: (context, index) => DashboardCard(
                      dashboardCardModel: controller.dashboardCardList[index],
                    )),
          )
        ],
      ),
    );
  }

  Container getDevider(context) {
    return Container(
      height: MediaQuery.of(context).size.width / 4 - 40,
      width: 1,
      color: Colors.black,
    );
  }

  Widget _getTotalData(String title, String data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: dashboardTextStyle,
        ),
        const SizedBox(
          height: AppValues.margin_6,
        ),
        Text(
          '৳ $data',
          style: dashboardTextStyle,
        ),
      ],
    );
  }
}
