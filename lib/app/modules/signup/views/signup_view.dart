import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/base_view.dart';
import 'package:syed_enterprise_pos/app/core/widget/primary_button.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';
import '../widgets/signup_text_field.dart';

class SignupView extends BaseView<SignupController> {
  SignupView({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return _getBody(context);
  }

  Widget _getBody(context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: AppValues.extraLargeMargin,
            ),
            child: Image(
              height: MediaQuery.of(context).size.width / 3,
              width: MediaQuery.of(context).size.width / 3,
              image: const AssetImage(
                'assets/images/syed_enterprise.png',
              ),
            ),
          ),
          Column(
            children: [
              SignUpTextField(
                controller: controller.signUpNameController,
                hint: 'Name',
                icon: const Icon(Icons.person_outline),
              ),
              getSpace(),
              // getRole(),
              // getSpace(),
              SignUpTextField(
                controller: controller.signUpEmailController,
                hint: 'Email',
                icon: const Icon(Icons.email_outlined),
              ),
              getSpace(),
              SignUpTextField(
                controller: controller.signUpPasswordController,
                hint: 'Password',
                icon: const Icon(Icons.lock_outlined),
              ),
            ],
          ),
          Column(
            children: [
              PrimaryButton(
                buttonText: 'Sign Up',
                onTap: () => controller.getSignedUp(),
              ),
              haveAccount(),
            ],
          ),
        ],
      ),
    );
  }

  haveAccount() {
    return Container(
      padding: const EdgeInsets.only(bottom: AppValues.padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account? ",
            style: highlightTextStyleSecondary,
          ),
          InkWell(
            onTap: () {
              Get.offNamed(Routes.SIGNIN);
            },
            child: Text(
              "Sign In",
              style: highlightTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox getSpace() {
    return const SizedBox(
      height: AppValues.margin,
    );
  }

  Widget getRole() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(
            right: AppValues.padding,
            left: AppValues.padding,
          ),
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.colorWhite,
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
                )),
            isExpanded: true,
            hint: Text(controller.roleSeletion.value),
            items:
                controller.role.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              controller.getRoleSeleted(value!);
            },
          ),
        ));
  }
}
