import 'package:bonbon_new/api/rest_service.dart';
import 'package:bonbon_new/controllers/index_controller.dart';
import 'package:bonbon_new/models/check_table_model.dart';
import 'package:bonbon_new/routes/routes_name.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScanController extends GetxController {
  IndexController indexController = Get.put(IndexController());
  TextEditingController tableCodeController = TextEditingController();
  Rx<CheckTableModel?> checkTableModel = CheckTableModel().obs;

  var box = GetStorage();
  @override
  void onClose() {
    super.onClose();
    indexController.currentIndex.value = 0;
  }

  tableCheck(String tableCode) async {
    debugPrint("statement $tableCode");

    var response = await RestServices.checkTable(box.read("token"), tableCode);
    if (response?.outletActive == true) {
      checkTableModel.value = response;
      Get.offNamed(RouteName.create_session, arguments: [tableCode]);
    }
  }
}
