import 'package:cloud_firestore/cloud_firestore.dart';

class DueProductModel {
  String? id;
  String? title;
  String? productId;
  double? sellingPrice;
  double? buyingPrice;
  double? stockCount;
  double? stockValue;
  String? unit;
  DueProductModel({
    this.id,
    this.title,
    this.productId,
    this.sellingPrice,
    this.buyingPrice,
    this.stockCount,
    this.stockValue,
    this.unit,
  });

  DueProductModel.fromMap(DocumentSnapshot data) {
    id = data.id;
    title = data['product_name'];
    productId = data['product_id'];
    sellingPrice = data['selling_price'];
    buyingPrice = data['buying_price'];
    stockCount = data['stock_count'];
    stockValue = data['stock_value'];
    unit = data['unit'];
  }
}
