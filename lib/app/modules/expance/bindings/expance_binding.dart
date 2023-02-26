import 'package:get/get.dart';

import '../controllers/expance_controller.dart';

class ExpanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpanceController>(
      () => ExpanceController(),
    );
  }
}
