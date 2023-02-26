import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/values/app_values.dart';
import 'package:syed_enterprise_pos/app/modules/signin/widgets/signin_text_field.dart';
import '../../../core/base/base_view.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/primary_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signin_controller.dart';

class SigninView extends BaseView<SigninController> {
  SigninView({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return _getBody(context);
  }

  Widget _getBody(context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppValues.largePadding,
        bottom: AppValues.padding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            height: MediaQuery.of(context).size.width / 3,
            width: MediaQuery.of(context).size.width / 3,
            image: const AssetImage(
              'assets/images/syed_enterprise.png',
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SignInTextField(
                      textEditingController: controller.signInemailController,
                      hint: 'Email',
                      icon: const Icon(Icons.email_outlined),
                    ),
                    SignInTextField(
                      textEditingController:
                          controller.signInPasswordController,
                      hint: 'Password',
                      icon: const Icon(Icons.lock_outlined),
                    ),
                    const SizedBox(
                      height: AppValues.marginBelowVerticalLine,
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                onTap: () => controller.getSignedIn(),
                buttonText: 'Sign In',
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don’t have an account? ",
                style: highlightTextStyleSecondary,
              ),
              InkWell(
                onTap: () {
                  Get.offNamed(Routes.SIGNUP);
                },
                child: Text(
                  "Sign UP",
                  style: highlightTextStyle,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
