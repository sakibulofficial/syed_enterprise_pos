import 'package:cloud_firestore/cloud_firestore.dart';

class ReportProductModel {
  String? id;
  String? title;
  double? sellingPrice;
  double? buyingPrice;
  double? stockCount;
  double? stockValue;
  String? unit;
  ReportProductModel({
    this.id,
    this.title,
    this.sellingPrice,
    this.buyingPrice,
    this.stockCount,
    this.stockValue,
    this.unit,
  });

  ReportProductModel.fromMap(DocumentSnapshot data) {
    id = data.id;
    title = data['product_name'];
    sellingPrice = data['selling_price'];
    buyingPrice = data['buying_price'];
    stockCount = data['stock_count'];
    stockValue = data['stock_value'];
    unit = data['unit'];
  }
}
