import 'package:bonbon_new/controllers/index_controller.dart';
import 'package:get/get.dart';

class InboxController extends GetxController {
  IndexController indexController = Get.put(IndexController());
  var currentIndex = 0.obs;
  @override
  void onClose() {
    super.onClose();
    indexController.currentIndex.value = 0;
  }
}
