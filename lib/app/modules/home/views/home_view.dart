import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/company_name.dart';
import 'package:syed_enterprise_pos/app/core/values/app_colors.dart';
import 'package:syed_enterprise_pos/app/core/values/app_values.dart';
import 'package:syed_enterprise_pos/app/core/widget/custom_app_bar.dart';
import 'package:syed_enterprise_pos/app/routes/app_pages.dart';
import '../../../core/base/base_view.dart';
import '../../../core/values/text_styles.dart';
import '../controllers/home_controller.dart';
import '../widgets/company_card.dart';

class HomeView extends BaseView<HomeController> {
  HomeView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Syed Enterprice',
      appBarTitleStyle: appBarTextStyle,
      actions: [
        InkWell(
          onTap: () => Get.toNamed(Routes.PROFILE),
          child: const Padding(
            padding: EdgeInsets.only(right: AppValues.padding),
            child: Image(
              width: 40,
              image: AssetImage(
                'assets/dashboard/profile.png',
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    return _getBody(context);
  }

  Widget _getBody(context) {
    return Container(
      padding: const EdgeInsets.all(AppValues.padding),
      child: Obx(
        () => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: controller.companyList.length,
          itemBuilder: (context, index) => CompanyCardWidget(
              title: controller.companyList[index].name!,
              onTap: () {
                CompanyName.getCompany(controller.companyList[index].name!);
                Get.toNamed(
                  Routes.DASHBOARD,
                  arguments: controller.companyList[index].name,
                );
              }),
        ),
      ),
    );
  }

  @override
  Widget? floatingActionButton(context) {
    return FloatingActionButton(
      backgroundColor: AppColors.colorPrimary,
      child: const Icon(
        Icons.add,
        color: AppColors.colorWhite,
      ),
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Create Company'),
          content: TextField(
            controller: controller.addCompanyController,
            decoration: InputDecoration(
              prefixIconColor: AppColors.iconColorDefault,
              filled: true,
              fillColor: AppColors.colorWhite,
              hintText: 'Company Name',
              hintStyle: hintTextStyle,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.textFieldBorderColor,
                ), //<-- SEE HERE
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.textFieldBorderColor,
                ), //<-- SEE HERE
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => controller.createCompany(),
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
