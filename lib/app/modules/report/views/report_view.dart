import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/values/app_values.dart';
import 'package:syed_enterprise_pos/app/core/values/text_styles.dart';
import 'package:syed_enterprise_pos/app/core/widget/custom_app_bar.dart';
import 'package:syed_enterprise_pos/app/modules/report/views/report_details.dart';
import 'package:syed_enterprise_pos/app/modules/report/widgets/report_card.dart';
import '../../../core/base/base_view.dart';
import '../controllers/report_controller.dart';

class ReportView extends BaseView<ReportController> {
  ReportView({
    super.key,
  });

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Report',
      appBarTitleStyle: appBarTextStyle,
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height - 164,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.reportList.length,
                    itemBuilder: (context, index) => ReportCard(
                      onTap: () async {
                        controller.customerDetails =
                            controller.reportList[index];
                        await controller.getProduct();
                        Get.to(
                          ReportDetails(),
                        );
                      },
                      reportModel: controller.reportList[index],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
