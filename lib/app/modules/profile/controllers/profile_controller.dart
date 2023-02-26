import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:syed_enterprise_pos/app/core/base/base_controller.dart';
import 'package:syed_enterprise_pos/app/routes/app_pages.dart';

class ProfileController extends BaseController {
  Future signOut() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => Get.offAllNamed(Routes.SIGNIN));
  }
}
