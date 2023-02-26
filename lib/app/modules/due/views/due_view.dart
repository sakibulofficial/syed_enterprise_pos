import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/base_view.dart';
import 'package:syed_enterprise_pos/app/core/values/text_styles.dart';
import 'package:syed_enterprise_pos/app/core/widget/custom_app_bar.dart';
import 'package:syed_enterprise_pos/app/modules/due/views/due_report_udpate_view.dart';
import 'package:syed_enterprise_pos/app/modules/due/widgets/due_card.dart';

import '../../../core/values/app_values.dart';
import '../controllers/due_controller.dart';

class DueView extends BaseView<DueController> {
  DueView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Due',
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
                    itemCount: controller.dueList.length,
                    itemBuilder: (context, index) {
                      if (controller.dueList[index].isPaid == false) {
                        return DueCard(
                          onTap: () async {
                            controller.dueReport = controller.dueList[index];
                            await controller
                                .getProduct(controller.dueList[index].id!);

                            Get.to(
                              DueReportUpdate(),
                            );
                          },
                          reportModel: controller.dueList[index],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
