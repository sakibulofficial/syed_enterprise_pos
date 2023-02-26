import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syed_enterprise_pos/app/core/base/base_controller.dart';
import 'package:syed_enterprise_pos/app/core/model/products_model.dart';
import 'package:syed_enterprise_pos/app/modules/due/model/due_model.dart';
import 'package:syed_enterprise_pos/app/modules/due/model/due_product_model.dart';
import '../../../core/base/company_name.dart';
import '../../../core/values/text_styles.dart';

class DueController extends BaseController {
  RxList<DueModel> dueList = RxList<DueModel>([]);
  final firestoreReport = FirebaseFirestore.instance
      .collection(CompanyName.selectedCompany)
      .doc('${CompanyName.selectedCompany}_report')
      .collection('report');
  Stream<List<DueModel>> getreport() => firestoreReport
      .snapshots()
      .map((event) => event.docs.map((e) => DueModel.fromMap(e)).toList());

  //
  // customer details
  //
  String getFormatedDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    String formatedDate = dateFormat.format(dateTime);
    return formatedDate;
  }

  late DueModel customerDetails;

  RxList<DueProductModel> productList = RxList<DueProductModel>([]);
  RxList<ProductModel> producrts = RxList<ProductModel>([]);

  getProduct(String id) async {
    productList.bindStream(FirebaseFirestore.instance
        .collection(CompanyName.selectedCompany)
        .doc('${CompanyName.selectedCompany}_report')
        .collection('report')
        .doc(id)
        .collection('products')
        .snapshots()
        .map((event) =>
            event.docs.map((e) => DueProductModel.fromMap(e)).toList()));
  }

  getTableTitle(String title) {
    return Text(
      textAlign: TextAlign.center,
      title,
      style: tableTitleTextStyle,
    );
  }

  ////
  /// update due
  ///
  ///
  late DueModel dueReport;

  RxList<DueProductModel> cartList = RxList<DueProductModel>([]);
  final isPaid = false.obs;
  final _user = FirebaseAuth.instance.currentUser;

  getUpdateReport() async {
    DueModel updateReport = DueModel(
      customerName: dueReport.customerName,
      customerNumber: dueReport.customerNumber,
      customerAddress: dueReport.customerAddress,
      buyingDate: dueReport.buyingDate,
      discount: dueReport.discount,
      due: isPaid.value == true ? 0 : dueReport.due,
      paid: isPaid.value == true ? dueReport.total : dueReport.paid,
      isPaid: isPaid.value,
      subTotal: dueReport.subTotal,
      total: dueReport.total,
    );

    final firestore = FirebaseFirestore.instance
        .collection(CompanyName.selectedCompany)
        .doc('${CompanyName.selectedCompany}_report')
        .collection('report')
        .doc(dueReport.id);
    final dataJson = {
      'customer_name': updateReport.customerName,
      'customer_number': updateReport.customerNumber,
      'customer_address': updateReport.customerAddress,
      'buying_date': updateReport.buyingDate,
      'u_id': _user?.uid,
      'discount': updateReport.discount,
      'is_paid': updateReport.isPaid,
      'sub_total': updateReport.subTotal,
      'total': updateReport.total,
    };

    await firestore.update(dataJson).then((value) async {
      Get.back();
    });
  }

  deleteReport(String id) async {
    await updateStock();

    FirebaseFirestore.instance
        .collection(CompanyName.selectedCompany)
        .doc('${CompanyName.selectedCompany}_report')
        .collection('report')
        .doc(id)
        .delete();
    Get.back();
  }

  updateStock() async {
    for (var i = 0; i < producrts.length; i++) {
      for (var j = 0; j < productList.length; j++) {
        if (producrts[i].id == productList[j].productId) {
          final firestore = FirebaseFirestore.instance
              .collection(CompanyName.selectedCompany)
              .doc('${CompanyName.selectedCompany}_products')
              .collection('products')
              .doc(productList[j].productId);
          final dataJson = {
            'product_name': productList[j].title,
            'buying_price': productList[j].buyingPrice,
            'selling_price': productList[j].sellingPrice,
            'stock_count':
                productList[j].stockCount! + producrts[i].stockCount!,
            'u_id': _user?.uid,
            'unit': productList[j].unit,
          };
          await firestore
              .update(dataJson)
              .then((value) => debugPrint('updated'));
        }
      }
    }
  }

  getSubtotal() {
    double subtotal = 0;
    for (var i = 0; i < cartList.length; i++) {
      subtotal = cartList[i].stockValue == null
          ? 0
          : subtotal + cartList[i].stockValue!;
    }
    return subtotal;
  }

  final firebaseGetProducts = FirebaseFirestore.instance
      .collection(CompanyName.selectedCompany)
      .doc('${CompanyName.selectedCompany}_products')
      .collection('products');
  Stream<List<ProductModel>> getProducts() => firebaseGetProducts
      .snapshots()
      .map((event) => event.docs.map((e) => ProductModel.fromMap(e)).toList());
  @override
  void onInit() {
    super.onInit();

    dueList.bindStream(getreport());
    producrts.bindStream(getProducts());
  }
}
