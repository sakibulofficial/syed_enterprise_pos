import 'package:get/get.dart';

import '../controllers/due_controller.dart';

class DueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DueController>(
      () => DueController(),
    );
  }
}
