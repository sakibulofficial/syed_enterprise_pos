import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/base_controller.dart';
import 'package:syed_enterprise_pos/app/routes/app_pages.dart';

class SigninController extends BaseController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final signInemailController = TextEditingController();
  final signInPasswordController = TextEditingController();

  getSignedIn() {
    String email = signInemailController.value.text;
    String password = signInPasswordController.value.text;
    debugPrint('object');
    signedIn(email, password);
  }

  signedIn(String email, String password) async {
    _auth
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => Get.offNamed(Routes.HOME))
        // ignore: invalid_return_type_for_catch_error
        .catchError((onError) => Get.snackbar('Something Wrong!', '$onError'));
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
