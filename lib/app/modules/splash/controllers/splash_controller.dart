import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/routes/app_pages.dart';
import '../../../core/base/base_controller.dart';

class SplashController extends BaseController {
  final _user = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    changeScreen();
    super.onInit();
  }

  changeScreen() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        if (_user != null) {
          debugPrint('$_user');
          Get.offNamed(Routes.HOME);
        } else {
          Get.offNamed(Routes.SIGNIN);
        }
      },
    );
  }
  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
