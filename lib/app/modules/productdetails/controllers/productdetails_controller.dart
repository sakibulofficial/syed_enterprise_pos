import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/base_controller.dart';
import 'package:syed_enterprise_pos/app/core/base/company_name.dart';
import 'package:syed_enterprise_pos/app/core/model/products_model.dart';

class ProductdetailsController extends BaseController {
  ProductModel product = Get.arguments;

  double stockValue() {
    return product.buyingPrice! * product.stockCount!;
  }

  final firestore = FirebaseFirestore.instance
      .collection(CompanyName.selectedCompany)
      .doc('${CompanyName.selectedCompany}_products')
      .collection('products');
  Stream<List<ProductModel>> getProducts() => firestore
      .snapshots()
      .map((event) => event.docs.map((e) => ProductModel.fromMap(e)).toList());

  RxList<ProductModel> productList = RxList<ProductModel>([]);
  getUpdatedProduct() {
    for (var i = 0; i < productList.length; i++) {
      if (productList[i].id == product.id) {
        product = productList[i];
      }
    }
  }

  productId() {
    // ignore: unused_local_variable
    final firestore = FirebaseFirestore.instance
        .collection(CompanyName.selectedCompany)
        .doc('${CompanyName.selectedCompany}_products')
        .collection('products')
        .doc(product.id);
  }

  @override
  void onInit() async {
    super.onInit();
    setData();
    productList.bindStream(getProducts());
    await getUpdatedProduct();
  }

  ///
  /// product update
  ///

  TextEditingController productNameController = TextEditingController();
  TextEditingController sellingPriceController = TextEditingController();
  TextEditingController buyingPriceController = TextEditingController();
  TextEditingController currentStockController = TextEditingController();
  TextEditingController productUnitController = TextEditingController();

  final _user = FirebaseAuth.instance.currentUser;

  updateProduct() {
    final updatedata = FirebaseFirestore.instance
        .collection(CompanyName.selectedCompany)
        .doc('${CompanyName.selectedCompany}_products')
        .collection('products')
        .doc(product.id);
    final dataJson = {
      'product_name': productNameController.value.text,
      'buying_price': getAvarage(),
      'selling_price': double.parse(sellingPriceController.value.text),
      'stock_count': getStock(),
      'u_id': _user?.uid,
      'unit': productUnitController.value.text,
    };
    updatedata.update(dataJson).then((value) {
      product = ProductModel(
        unit: productUnitController.value.text,
        stockCount: getStock(),
        sellingPrice: double.parse(sellingPriceController.value.text),
        title: productNameController.value.text,
        id: product.id,
        buyingPrice: getAvarage(),
        uId: _user?.uid,
        stockValue: stockValue(),
      );
      Get.back();
    });
  }

  double getStock() {
    double stockcount =
        double.parse(currentStockController.value.text) + product.stockCount!;

    return stockcount;
  }

  double getAvarage() {
    double previousStockValue = product.buyingPrice! * product.stockCount!;
    double previousStockcount = product.stockCount!;
    double newStockvalue = double.parse(buyingPriceController.value.text) *
        double.parse(currentStockController.value.text);
    double newStockcount = double.parse(currentStockController.value.text);
    double avaragePrice = 0;
    double totalStock = previousStockcount + newStockcount;
    double totalStockValue = previousStockValue + newStockvalue;

    avaragePrice = totalStockValue / totalStock;
    return avaragePrice;
  }

  setData() {
    productNameController.text = product.title!;
    sellingPriceController.text = product.sellingPrice.toString();
    buyingPriceController.text = product.buyingPrice.toString();
    currentStockController.text = product.stockCount.toString();
    productUnitController.text = product.unit!;
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
}
