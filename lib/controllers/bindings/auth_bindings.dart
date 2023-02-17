import 'package:bonbon_new/controllers/auth_controller.dart';

import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
