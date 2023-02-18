import 'package:bonbon_new/api/rest_service.dart';
import 'package:bonbon_new/controllers/index_controller.dart';
import 'package:bonbon_new/models/check_table_model.dart';
import 'package:bonbon_new/models/table_model.dart';
import 'package:bonbon_new/routes/routes_name.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScanController extends GetxController {
  IndexController indexController = Get.put(IndexController());
  TextEditingController tableCodeController = TextEditingController();
  Rx<CheckTableModel?> checkTableModel = CheckTableModel().obs;
  Rx<TableModel?> tableModel = TableModel().obs;

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

      var responseTable =
          await RestServices.getTable(box.read("token"), tableCode);

      tableModel.value = responseTable;

      Get.offNamed(RouteName.create_session,
          arguments: [tableModel.value?.outlet?.id, tableCode]);
    }
  }
}
