import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:syed_enterprise_pos/app/core/base/base_controller.dart';
import 'package:syed_enterprise_pos/app/routes/app_pages.dart';

import '../../home/models/company_model.dart';

class SignupController extends BaseController {
  final signUpNameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxList<CompanyModel> companyList = RxList<CompanyModel>([]);

  final firestore = FirebaseFirestore.instance.collection('companys');

  Stream<List<CompanyModel>> getCompanys() => firestore
      .snapshots()
      .map((event) => event.docs.map((e) => CompanyModel.fromMap(e)).toList());

  @override
  void onInit() {
    super.onInit();

    companyList.bindStream(getCompanys());
  }

  List<String> role = ['Admin', 'Role ', 'role Two', 'role three'];
  var roleSeletion = 'Admin'.obs;

  getRoleSeleted(String seleted) {
    roleSeletion.value = seleted;
    Logger().i(seleted);
  }

  getSignedUp() {
    String name = signUpNameController.value.text;
    String email = signUpEmailController.value.text;
    String password = signUpPasswordController.value.text;

    createUser(name, 'Admin', email, password);
  }

  createUser(String name, String role, String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      saveUserData();
      Get.offNamed(Routes.SIGNIN);
    })
        // ignore: invalid_return_type_for_catch_error
        .catchError((onError) => Get.snackbar('Something Wrong!', '$onError'));
  }

  saveUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final firestore = FirebaseFirestore.instance.collection('users').doc();
    final dataJson = {
      'name': signUpNameController.value.text,
      'email': signUpEmailController.value.text,
      'role': 'admin',
      'u_id': user?.uid,
    };

    await firestore.set(dataJson);
    Get.back();
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
