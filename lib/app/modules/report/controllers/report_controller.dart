import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syed_enterprise_pos/app/core/base/base_controller.dart';
import 'package:syed_enterprise_pos/app/modules/report/models/report_model.dart';
import '../../../core/base/company_name.dart';
import '../../../core/values/text_styles.dart';
import '../models/report_product_model.dart';

class ReportController extends BaseController {
  RxList<ReportModel> reportList = RxList<ReportModel>([]);
  final firestoreReport = FirebaseFirestore.instance
      .collection(CompanyName.selectedCompany)
      .doc('${CompanyName.selectedCompany}_report')
      .collection('report');
  Stream<List<ReportModel>> getreport() => firestoreReport
      .snapshots()
      .map((event) => event.docs.map((e) => ReportModel.fromMap(e)).toList());
  //
  // customer details
  //
  String getFormatedDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    String formatedDate = dateFormat.format(dateTime);
    return formatedDate;
  }

  late ReportModel customerDetails;

  RxList<ReportProductModel> productList = RxList<ReportProductModel>([]);
  RxList<TableRow> producrts = RxList<TableRow>([]);

  getProduct() async {
    productList.bindStream(FirebaseFirestore.instance
        .collection(CompanyName.selectedCompany)
        .doc('${CompanyName.selectedCompany}_report')
        .collection('report')
        .doc(customerDetails.id)
        .collection('products')
        .snapshots()
        .map((event) =>
            event.docs.map((e) => ReportProductModel.fromMap(e)).toList()));

    for (var i = 0; i < productList.length; i++) {
      producrts.add(TableRow(children: [
        getTableTitle('${i + 1}'),
        getTableTitle(productList[i].title.toString()),
        getTableTitle(productList[i].stockCount.toString()),
        getTableTitle(productList[i].unit.toString()),
        getTableTitle(productList[i].sellingPrice.toString()),
        getTableTitle(productList[i].stockValue.toString()),
      ]));
    }
  }

  getTableTitle(String title) {
    return Text(
      textAlign: TextAlign.center,
      title,
      style: tableTitleTextStyle,
    );
  }

  @override
  void onInit() {
    super.onInit();
    reportList.bindStream(getreport());
  }
}
