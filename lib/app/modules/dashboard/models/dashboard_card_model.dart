import 'package:flutter/material.dart';
import 'package:syed_enterprise_pos/app/modules/home/models/company_model.dart';

class DashboardCardModel {
  String name;
  String image;
  VoidCallback onTap;
  CompanyModel? companyName;
  DashboardCardModel({
    this.companyName,
    required this.name,
    required this.image,
    required this.onTap,
  });
}
