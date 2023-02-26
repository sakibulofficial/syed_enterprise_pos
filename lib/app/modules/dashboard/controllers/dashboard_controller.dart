import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/base_controller.dart';
import 'package:syed_enterprise_pos/app/modules/dashboard/models/dashboard_card_model.dart';

import '../../../core/base/company_name.dart';
import '../../../core/model/products_model.dart';
import '../../../routes/app_pages.dart';
import '../../expance/Model/expance_model.dart';

class DashboardController extends BaseController {
  String data = Get.arguments;

  final firestore = FirebaseFirestore.instance
      .collection(Get.arguments.toString())
      .doc('${Get.arguments}_products')
      .collection('products');
  RxList<ProductModel> productList = RxList<ProductModel>([]);

  double getStockValue() {
    double stockvalue = 0;
    for (var i = 0; i < productList.length; i++) {
      double productStockvalue =
          productList[i].buyingPrice! * productList[i].stockCount!;
      stockvalue = stockvalue + productStockvalue;
    }

    return stockvalue;
  }

  int getlowStock() {
    int lowStock = 0;
    for (var i = 0; i < productList.length; i++) {
      if (productList[i].stockCount == 0) {
        lowStock = lowStock + 1;
      }
    }

    return lowStock;
  }

  RxList<ExpanceModel> expances = RxList([]);

  double getTotalExpance() {
    double todaysTotal = 0;

    for (var i = 0; i < expances.length; i++) {
      DateTime dateTime = DateTime.parse(expances[i].date!);
      if (DateTime.now().month == dateTime.month) {
        todaysTotal = todaysTotal + expances[i].amount!;
      }
    }

    return todaysTotal;
  }

  List<DashboardCardModel> dashboardCardList = [
    DashboardCardModel(
      name: 'Stock',
      image: 'stock.png',
      onTap: () => Get.toNamed(
        Routes.PRODUCTS,
        arguments: Get.arguments,
      ),
    ),
    DashboardCardModel(
        name: 'Products',
        image: 'product_list.png',
        onTap: () => Get.toNamed(
              Routes.PRODUCTS,
              arguments: Get.arguments,
            )),
    DashboardCardModel(
      name: 'Report',
      image: 'report.png',
      onTap: () => Get.toNamed(
        Routes.REPORT,
      ),
    ),
    DashboardCardModel(
        name: 'Sell',
        image: 'sell.png',
        onTap: () => Get.toNamed(
              Routes.SELL,
              arguments: Get.arguments,
            )),
    DashboardCardModel(
      name: 'Expance',
      image: 'expance.png',
      onTap: () {
        Get.toNamed(
          Routes.EXPANCE,
        );
      },
    ),
    DashboardCardModel(
      name: 'Due',
      image: 'due.png',
      onTap: () {
        Get.toNamed(
          Routes.DUE,
        );
      },
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    getExpances();
    productList.bindStream(getProducts());
  }

  getExpances() {
    expances.bindStream(FirebaseFirestore.instance
        .collection(CompanyName.selectedCompany)
        .doc('${CompanyName.selectedCompany}_expances')
        .collection('expances')
        .snapshots()
        .map((event) =>
            event.docs.map((e) => ExpanceModel.fromMap(e)).toList()));
  }

  Stream<List<ProductModel>> getProducts() => firestore
      .snapshots()
      .map((event) => event.docs.map((e) => ProductModel.fromMap(e)).toList());

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
