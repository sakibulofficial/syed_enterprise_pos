import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateProductController extends BaseController {
  TextEditingController productNameController = TextEditingController();
  TextEditingController sellingPriceController = TextEditingController();
  TextEditingController buyingPriceController = TextEditingController();
  TextEditingController currentStockController = TextEditingController();
  TextEditingController productUnitController = TextEditingController();

  final _user = FirebaseAuth.instance.currentUser;

  Future<void> createProduct() async {
    final firestore = FirebaseFirestore.instance
        .collection(Get.arguments.toString())
        .doc('${Get.arguments}_products')
        .collection('products');
    final dataJson = {
      'product_name': productNameController.value.text,
      'buying_price': double.parse(buyingPriceController.value.text),
      'selling_price': double.parse(sellingPriceController.value.text),
      'stock_count': double.parse(currentStockController.value.text),
      'u_id': _user?.uid,
      'unit': productUnitController.value.text,
    };

    await firestore.add(dataJson);
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
