import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/company_name.dart';
import 'package:syed_enterprise_pos/app/core/model/products_model.dart';
import '../../../core/base/base_controller.dart';

class ProductsController extends BaseController {
  final firestore = FirebaseFirestore.instance
      .collection(CompanyName.selectedCompany)
      .doc('${CompanyName.selectedCompany}_products')
      .collection('products');
  RxList<ProductModel> productList = RxList<ProductModel>([]);

  @override
  void onInit() {
    super.onInit();
    productList.bindStream(getProducts());
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;

  Stream<List<ProductModel>> getProducts() => firestore
      .snapshots()
      .map((event) => event.docs.map((e) => ProductModel.fromMap(e)).toList());
}
