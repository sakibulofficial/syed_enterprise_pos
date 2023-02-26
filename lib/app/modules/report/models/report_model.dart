import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syed_enterprise_pos/app/modules/report/models/report_product_model.dart';

class ReportModel {
  String? id;
  String? customerName;
  String? customerNumber;
  String? customerAddress;
  String? buyingDate;
  String? uId;
  List<ReportProductModel>? products = [];
  double? subTotal;
  double? total;
  double? discount;
  bool? isPaid;
  ReportModel({
    this.id,
    this.customerName,
    this.customerNumber,
    this.customerAddress,
    this.buyingDate,
    this.uId,
    this.products,
    this.subTotal,
    this.total,
    this.discount,
    this.isPaid,
  });

  ReportModel.fromMap(DocumentSnapshot data) {
    id = data.id;
    customerName = data['customer_name'];
    customerNumber = data['customer_number'];
    customerAddress = data['customer_address'];
    buyingDate = data['buying_date'];
    uId = data['u_id'];
    subTotal = data['sub_total'];
    total = data['total'];
    discount = data['discount'];
    isPaid = data['is_paid'];
  }
}
