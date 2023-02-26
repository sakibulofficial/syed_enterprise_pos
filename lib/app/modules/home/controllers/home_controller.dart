import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/base_controller.dart';
import '../models/company_model.dart';

class HomeController extends BaseController {
  TextEditingController addCompanyController = TextEditingController();

  RxList<CompanyModel> companyList = RxList<CompanyModel>([]);

  final firestore = FirebaseFirestore.instance.collection('companys');
  createCompany() async {
    final dataJson = {'company_name': addCompanyController.value.text};

    {
      companyList.add(CompanyModel(
        name: addCompanyController.value.text,
      ));
    }

    await firestore.add(dataJson);
    Get.back();
  }

  Stream<List<CompanyModel>> getCompanys() => firestore
      .snapshots()
      .map((event) => event.docs.map((e) => CompanyModel.fromMap(e)).toList());

  @override
  void onInit() {
    super.onInit();

    companyList.bindStream(getCompanys());
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

}
