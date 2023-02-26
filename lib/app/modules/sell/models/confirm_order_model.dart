import 'package:syed_enterprise_pos/app/modules/sell/models/product_confirm_model.dart';

class ConfirmOrderModel {
  String? id;
  String? customerName;
  String? customerNumber;
  String? customerAddress;
  String? buyingDate;
  String? uId;
  List<ProductConfirmModel>? products = [];
  double? subTotal;
  double? total;
  double? paid;
  double? due;
  double? discount;
  bool? isPaid;
  ConfirmOrderModel({
    this.id,
    this.customerName,
    this.customerNumber,
    this.customerAddress,
    this.buyingDate,
    this.uId,
    this.products,
    this.subTotal,
    this.total,
    this.due,
    this.paid,
    this.discount,
    this.isPaid,
  });
}
