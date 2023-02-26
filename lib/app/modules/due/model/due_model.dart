import 'package:cloud_firestore/cloud_firestore.dart';

class DueModel {
  String? id;
  String? customerName;
  String? customerNumber;
  String? customerAddress;
  String? buyingDate;
  String? uId;
  double? subTotal;
  double? total;
  double? paid;
  double? due;
  double? discount;
  bool? isPaid;
  DueModel({
    this.id,
    this.customerName,
    this.customerNumber,
    this.customerAddress,
    this.buyingDate,
    this.uId,
    this.subTotal,
    this.total,
    this.paid,
    this.due,
    this.discount,
    this.isPaid,
  });

  DueModel.fromMap(DocumentSnapshot data) {
    id = data.id;
    customerName = data['customer_name'];
    customerNumber = data['customer_number'];
    customerAddress = data['customer_address'];
    buyingDate = data['buying_date'];
    uId = data['u_id'];
    subTotal = data['sub_total'];
    discount = data['discount'];
    total = data['total'];
    due = data['due'];
    paid = data['paid'];
    isPaid = data['is_paid'];
  }
}
