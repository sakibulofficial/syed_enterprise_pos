// ignore_for_file: unrelated_type_equality_checks
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syed_enterprise_pos/app/core/base/base_controller.dart';
import 'package:syed_enterprise_pos/app/core/base/company_name.dart';
import 'package:syed_enterprise_pos/app/modules/expance/model/button_model.dart';
import 'package:syed_enterprise_pos/app/modules/expance/model/expance_model.dart';

class ExpanceController extends BaseController {
  final isSelected = 1.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  List<ButtonModel> buttons = [
    ButtonModel(title: 'Today', count: 0),
    ButtonModel(title: 'Month', count: 1),
    ButtonModel(title: 'Year', count: 2),
  ];

  final firestore = FirebaseFirestore.instance
      .collection(CompanyName.selectedCompany)
      .doc('${CompanyName.selectedCompany}_expances')
      .collection('expances');

  RxList<ExpanceModel> expances = RxList([]);

  getExpances() {
    expances.bindStream(firestore.snapshots().map(
        (event) => event.docs.map((e) => ExpanceModel.fromMap(e)).toList()));
  }

  createExpance() async {
    final dataJson = {
      'title': titleController.value.text,
      'amount': double.parse(amountController.value.text),
      'date': DateTime.now().toString(),
    };

    await firestore.add(dataJson).then(
          (value) => Get.back(),
        );
  }

  String getFormatedDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    String formatedDate = dateFormat.format(dateTime);
    return formatedDate;
  }

  double getTotal() {
    double todaysTotal = 0;

    if (isSelected == 0) {
      for (var i = 0; i < expances.length; i++) {
        DateTime dateTime = DateTime.parse(expances[i].date!);
        if (DateTime.now().day == dateTime.day) {
          todaysTotal = todaysTotal + expances[i].amount!;
        }
      }
    } else if (isSelected == 1) {
      for (var i = 0; i < expances.length; i++) {
        DateTime dateTime = DateTime.parse(expances[i].date!);
        if (DateTime.now().month == dateTime.month) {
          todaysTotal = todaysTotal + expances[i].amount!;
        }
      }
    } else if (isSelected == 2) {
      for (var i = 0; i < expances.length; i++) {
        DateTime dateTime = DateTime.parse(expances[i].date!);
        if (DateTime.now().year == dateTime.year) {
          todaysTotal = todaysTotal + expances[i].amount!;
        }
      }
    }

    return todaysTotal;
  }

  @override
  void onInit() async {
    super.onInit();
    await getExpances();
  }
}
