import 'package:bonbon_new/api/base/base_response.dart';
import 'package:bonbon_new/api/const/api_endpoint.dart';
import 'package:bonbon_new/api/rest_service.dart';
import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/controllers/index_controller.dart';
import 'package:bonbon_new/models/check_table_model.dart';
import 'package:bonbon_new/models/table_model.dart';
import 'package:bonbon_new/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScanController extends GetxController {
  IndexController indexController = Get.put(IndexController());
  TextEditingController tableCodeController = TextEditingController();

  // var checkTableModel = CheckTableModel().obs;
  // var tableModel = TableModel().obs;

  var box = GetStorage();
  @override
  void onClose() {
    super.onClose();
    indexController.currentIndex.value = 0;
  }

  Future<void> tableCheck(String tableCode) async {
    debugPrint("statement $tableCode");
    GlobalHelper.easyLoading();

    // var response = await RestServices.checkTable(box.read("token"), tableCode);
    // if (response?.outletActive == true) {
    //   checkTableModel.value = response;
    //   var responseTable =
    //       await RestServices.getTable(box.read("token"), tableCode);

    //   tableModel.value = responseTable;

    //   Get.offNamed(RouteName.create_session,
    //       arguments: [tableModel.value?.outlet?.id, tableCode]);
    // }

    await BaseResponse<CheckTableModel>()
        .getData(
            path: '',
            param: 'search/' + tableCode + "/check",
            fromJson: checkTableModelFromJson,
            token: box.read("token"))
        .then(
      (res) {
        CheckTableModel? response = res;
        if (response?.outletActive == true) {
          EasyLoading.dismiss();
          getTable(box.read("token"), tableCode);
        }
      },
    );
  }

  Future<void> getTable(String token, String tableCode) async {
    GlobalHelper.easyLoading();
    await BaseResponse<TableModel>()
        .getData(
            path: '',
            param: "table/${tableCode}?include=group,outlet",
            fromJson: tableModelFromJson,
            token: box.read("token"))
        .then(
      (res) {
        EasyLoading.dismiss();
        TableModel? tableModel = res;
        if (tableModel != false) {
          Get.offNamed(RouteName.create_session,
              arguments: [tableModel?.outlet?.id, tableCode]);
        }
      },
    );
  }
}
