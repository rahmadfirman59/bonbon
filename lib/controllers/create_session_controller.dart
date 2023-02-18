// ignore_for_file: prefer_collection_literals, deprecated_member_use, unnecessary_overrides, prefer_const_constructors, unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:bonbon_new/api/rest_service.dart';
import 'package:bonbon_new/models/check_table_session_model.dart';
import 'package:bonbon_new/models/create_session_model.dart';
import 'package:bonbon_new/routes/routes_name.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CreateSessionController extends GetxController {
  Rx<TextEditingController?> personController = TextEditingController().obs;
  RxList<CheckTableSessionModel> checkTableSessionModel =
      <CheckTableSessionModel>[].obs;

  Rx<CreateSessionModel?> createSessionModel = CreateSessionModel().obs;
  var box = GetStorage();
  var tableCode = "".obs;
  var checkInvite = true.obs;
  Timer? timer;

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
    timer?.cancel();
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

  Future<void> getSessionTable(String? tableCode) async {
    timer = Timer.periodic(Duration(milliseconds: 5000), (Timer t) {
      timerDispose();
      getSessionTable(tableCode);
    });
    var response =
        await RestServices.getTableSession(box.read("token"), tableCode);

    checkTableSessionModel.value = response;
    update();
  }

  void createSession(String pax, String? outletId, String tableId) async {
    Map<String, dynamic> body = {
      "pax": int.parse(pax),
      "type": "dine_in",
      "force": true,
      "note": "",
      "outlet_id": "${outletId}",
      "table_id": "${tableCode}",
    };
    debugPrint("$outletId dan  $tableId");
    var response = await RestServices.createSession(box.read("token"), body);
    createSessionModel.value = response;

    if (createSessionModel.value?.status == "awaiting_approval") {
      Get.offNamed(RouteName.waiting_page);
    }
  }

  void timerDispose() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      timer = null;
    }
  }
}
