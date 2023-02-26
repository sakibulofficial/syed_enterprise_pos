import 'package:cloud_firestore/cloud_firestore.dart';

class ExpanceModel {
  String? id;
  String? title;
  String? date;
  double? amount;
  ExpanceModel({
    this.id,
    required this.title,
    required this.date,
    required this.amount,
  });

  ExpanceModel.fromMap(DocumentSnapshot data) {
    id = data.id;
    title = data['title'];
    amount = data['amount'];
    date = data['date'].toString();
  }
}
