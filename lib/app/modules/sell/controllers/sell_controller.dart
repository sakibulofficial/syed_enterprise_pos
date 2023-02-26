import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/base_controller.dart';
import 'package:syed_enterprise_pos/app/core/base/company_name.dart';
import 'package:syed_enterprise_pos/app/modules/sell/models/confirm_order_model.dart';
import '../../../core/model/products_model.dart';
import '../models/product_confirm_model.dart';

class SellController extends BaseController {
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerNumberController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();
  TextEditingController customersPaidController = TextEditingController();
  TextEditingController customersDiscountController = TextEditingController();
  RxList<ProductConfirmModel> cartList = RxList<ProductConfirmModel>([]);
  final isPaid = false.obs;

  final discount = 0.obs;
  final paid = 0.obs;
  final _user = FirebaseAuth.instance.currentUser;
  final firestore = FirebaseFirestore.instance
      .collection(Get.arguments.toString())
      .doc('${Get.arguments}_products')
      .collection('products');
  RxList<ProductModel> productList = RxList<ProductModel>([]);

  addToCart(ProductModel product) {
    if (cartList.where((element) => element.id == product.id).isNotEmpty) {
    } else {
      cartList.add(ProductConfirmModel(
        id: product.id,
        title: product.title,
        uId: product.uId,
        sellingPrice: product.sellingPrice,
        buyingPrice: product.buyingPrice,
        stockCount: 1,
        stockValue: product.sellingPrice! * 1,
        unit: product.unit,
      ));
    }
  }

  deleteProduct(int index) {
    cartList.removeAt(index);
  }

  getConfirmOrder() async {
    ConfirmOrderModel confirmOrder = ConfirmOrderModel(
      customerName: customerNameController.value.text,
      customerNumber: customerNumberController.value.text,
      customerAddress: customerAddressController.value.text,
      buyingDate: DateTime.now().toString(),
      discount: double.parse(customersDiscountController.value.text),
      isPaid: isPaid.value,
      subTotal: getSubtotal(),
      total:
          getSubtotal() - double.parse(customersDiscountController.value.text),
      paid: double.parse(customersPaidController.value.text),
      due: getDue(),
    );

    final firestore = FirebaseFirestore.instance
        .collection(CompanyName.selectedCompany)
        .doc('${CompanyName.selectedCompany}_report')
        .collection('report');
    final dataJson = {
      'customer_name': confirmOrder.customerName,
      'customer_number': confirmOrder.customerNumber,
      'customer_address': confirmOrder.customerAddress,
      'buying_date': confirmOrder.buyingDate,
      'u_id': _user?.uid,
      'discount': confirmOrder.discount,
      'paid': confirmOrder.paid,
      'due': confirmOrder.due,
      'is_paid': confirmOrder.isPaid,
      'sub_total': confirmOrder.subTotal,
      'total': confirmOrder.total,
    };

    await firestore.add(dataJson).then((value) async {
      final addProduct = FirebaseFirestore.instance
          .collection(CompanyName.selectedCompany)
          .doc('${CompanyName.selectedCompany}_report')
          .collection('report')
          .doc(value.id)
          .collection('products');

      for (var i = 0; i < cartList.length; i++) {
        ProductConfirmModel product = ProductConfirmModel(
          id: cartList[i].id,
          title: cartList[i].title,
          sellingPrice: cartList[i].sellingPrice,
          buyingPrice: cartList[i].buyingPrice,
          stockCount: cartList[i].stockCount,
          stockValue: cartList[i].stockValue,
          unit: cartList[i].unit,
        );

        final dataJson = {
          'product_id': product.id,
          'product_name': product.title,
          'buying_price': product.buyingPrice,
          'selling_price': product.sellingPrice,
          'stock_count': product.stockCount,
          'stock_value': product.stockValue,
          'unit': product.unit.toString(),
        };
        await addProduct.add(dataJson).then((value) => updateProduct());
      }
    });
    setEmpty();
    Get.back();
  }

  setEmpty() {
    customerNameController.clear();
    customerNumberController.clear();
    customerAddressController.clear();
    customersPaidController.clear();
    customersDiscountController.clear();
    cartList.removeRange(0, cartList.length);
  }

  updateProduct() {
    for (var i = 0; i < cartList.length; i++) {
      for (var j = 0; j < productList.length; j++) {
        if (cartList[i].id == productList[j].id) {
          getUpdateProduct(i, j, cartList[i].id!);
        }
      }
    }
  }

  getUpdateProduct(int i, int j, String id) {
    final updatedata = FirebaseFirestore.instance
        .collection(CompanyName.selectedCompany)
        .doc('${CompanyName.selectedCompany}_products')
        .collection('products')
        .doc(id);
    final dataJson = {
      'product_name': cartList[i].title,
      'buying_price': cartList[i].buyingPrice,
      'selling_price': cartList[i].sellingPrice,
      'stock_count': productList[j].stockCount! - cartList[i].stockCount!,
      'u_id': _user?.uid,
      'unit': cartList[i].buyingPrice
    };
    updatedata.update(dataJson).then((value) {
      debugPrint('done');
    });
  }

  double getDue() {
    double total =
        getSubtotal() - double.parse(customersDiscountController.value.text);
    double due = total - double.parse(customersPaidController.value.text);
    return due;
  }

  getTotal() {
    double total = 0;
    for (var i = 0; i <= cartList.length; i++) {
      total = cartList[i].stockValue == null
          ? 0.0
          : total + cartList[i].stockValue!;
      return total;
    }
  }

  double getTotalAfterDiscount() {
    double subtotal = 0;
    for (var i = 0; i < cartList.length; i++) {
      subtotal = cartList[i].stockValue == null
          ? 0.0
          : subtotal + cartList[i].stockValue!;
    }

    return subtotal - discount.value;
  }

  double getTotaldue() {
    double total = getTotalAfterDiscount();
    return total - paid.value;
  }

  getSubtotal() {
    double subtotal = 0;
    for (var i = 0; i < cartList.length; i++) {
      subtotal = cartList[i].stockValue == null
          ? 0.0
          : subtotal + cartList[i].stockValue!;
    }
    return subtotal;
  }

  getQuantity(ProductConfirmModel product, int index, String value) {
    double quantity = value == '' ? 1 : double.parse(value);
    cartList[index] = ProductConfirmModel(
      id: product.id,
      title: product.title,
      uId: product.uId,
      sellingPrice: product.sellingPrice,
      buyingPrice: product.buyingPrice,
      stockCount: quantity,
      stockValue: quantity * product.sellingPrice!,
      unit: product.unit,
    );
  }

  @override
  void onInit() {
    super.onInit();

    productList.bindStream(getProducts());
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;

  Stream<List<ProductModel>> getProducts() => firestore
      .snapshots()
      .map((event) => event.docs.map((e) => ProductModel.fromMap(e)).toList());
}
