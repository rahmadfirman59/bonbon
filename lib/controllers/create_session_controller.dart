// ignore_for_file: prefer_collection_literals, deprecated_member_use, unnecessary_overrides

import 'package:bonbon_new/api/rest_service.dart';
import 'package:bonbon_new/models/check_table_session_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CreateSessionController extends GetxController {
  Rx<TextEditingController?> personController = TextEditingController().obs;
  RxList<CheckTableSessionModel> checkTableSessionModel =
      <CheckTableSessionModel>[].obs;
  var box = GetStorage();
  var tableCode = "".obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    personController.value?.text = count.value.toString();
  }

  @override
  void onReady() {
    super.onReady();
    getSessionTable(tableCode.value);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() {
    count.value++;
    personController.value?.text = count.value.toString();
  }

  void decrement() {
    if (count.value != 0) {
      count.value--;
    }
    personController.value?.text = count.value.toString();
  }

  void getSessionTable(String? tableCode) async {
    var response =
        await RestServices.getTableSession(box.read("token"), tableCode);

    checkTableSessionModel.value = response;
    update();
  }

  void createSession(String? outletId, String tableId) async {
    debugPrint("$outletId dan  $tableId");
    // var token = await _localDataSources.loadToken();
    // initLoading();
    // final AppResponse response = await _remoteDataSources.createSession(
    //     token, count.value, outletId, "dine_in", "", true, tableId);

    // if (response.success) {
    //   EasyLoading.showSuccess("Resust Table");
    //   createSessionModel.value = response.response;

    //   if (createSessionModel.value?.status == "awaiting_approval") {
    //     Get.toNamed(Routes.SESSION_WAITING);
    //   } else {}
    // } else {
    //   errorModel.value = response.response;
    //   EasyLoading.showError("${errorModel.value?.message}");
    // }
  }
}
