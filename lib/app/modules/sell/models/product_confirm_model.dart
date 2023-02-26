import 'package:cloud_firestore/cloud_firestore.dart';

class ProductConfirmModel {
  String? id;
  String? title;
  String? uId;
  double? sellingPrice;
  double? buyingPrice;
  double? stockCount;
  double? stockValue;
  String? unit;
  ProductConfirmModel({
    this.id,
    this.title,
    this.uId,
    this.sellingPrice,
    this.buyingPrice,
    this.stockCount,
    this.stockValue,
    this.unit,
  });

  ProductConfirmModel.fromMap(DocumentSnapshot data) {
    id = data.id;
    title = data['product_name'];
    uId = data['u_id'];
    sellingPrice = double.parse(data['selling_price']);
    buyingPrice = double.parse(data['buying_price']);
    stockCount = double.parse(data['stock_count']);
    unit = data['unit'];
  }
}
