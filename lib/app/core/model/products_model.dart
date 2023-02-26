import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? title;
  String? uId;
  double? sellingPrice;
  double? buyingPrice;
  bool? isSelected;
  double? stockCount;
  double? stockValue;
  String? unit;
  ProductModel({
    required this.id,
    required this.title,
    required this.uId,
    this.isSelected = false,
    required this.sellingPrice,
    required this.buyingPrice,
    required this.stockCount,
    required this.stockValue,
    required this.unit,
  });

  ProductModel.fromMap(DocumentSnapshot data) {
    id = data.id;
    title = data['product_name'];
    isSelected = false;
    uId = data['u_id'];
    sellingPrice = data['selling_price'];
    buyingPrice = data['buying_price'];
    stockCount = data['stock_count'];
    unit = data['unit'].toString();
  }
}
