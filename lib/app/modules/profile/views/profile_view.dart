import 'package:flutter/material.dart';
import 'package:syed_enterprise_pos/app/core/base/base_view.dart';
import 'package:syed_enterprise_pos/app/core/values/text_styles.dart';
import 'package:syed_enterprise_pos/app/core/widget/custom_app_bar.dart';
import 'package:syed_enterprise_pos/app/core/widget/primary_button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends BaseView<ProfileController> {
  ProfileView({
    super.key,
  });

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Profile',
      appBarTitleStyle: appBarTextStyle,
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: PrimaryButton(
        onTap: () => controller.signOut(),
        buttonText: 'Sign Out',
      ),
    );
  }
}
