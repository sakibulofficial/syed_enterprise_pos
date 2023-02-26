import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyModel {
  String? docId;
  String? name;
  CompanyModel({
    this.docId,
    required this.name,
  });

  CompanyModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data['company_name'];
  }
}
