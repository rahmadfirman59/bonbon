// ignore_for_file: prefer_collection_literals, deprecated_member_use, unnecessary_overrides, prefer_const_constructors, unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:bonbon_new/api/const/api_endpoint.dart';
import 'package:bonbon_new/controllers/helpers/global_helpers.dart';

import 'package:bonbon_new/models/check_table_session_model.dart';
import 'package:bonbon_new/models/create_session_model.dart';
import 'package:bonbon_new/routes/routes_name.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../api/base/base_response.dart';

class CreateSessionController extends GetxController {
  Rx<TextEditingController?> personController = TextEditingController().obs;
  var checkTableSessionModel = <CheckTableSessionModel>[].obs;

  // Rx<CreateSessionModel?> createSessionModel = CreateSessionModel().obs;
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

  Future<void> getSessionTable(String tableCode) async {
    timer = Timer.periodic(Duration(milliseconds: 5000), (Timer t) {
      timerDispose();
      getSessionTable(tableCode);
    });
    // var response =
    // await RestServices.getTableSession(box.read("token"), tableCode);

    // checkTableSessionModel.value = response;
    await BaseResponse<List<CheckTableSessionModel>>()
        .getData(
            path: '',
            param:
                'table/${tableCode}/session?include=members.user,orders.variant.images,leader',
            fromJson: checkTableSessionModelFromJson,
            token: box.read("token"))
        .then(
      (res) {
        EasyLoading.dismiss();
        checkTableSessionModel.value = res!;

        // if (checkTableSessionModel != false) {
        //   EasyLoading.dismiss();
        // getTable(box.read("token"), tableCode);
        // }
        update();
      },
    );
  }

  void createSession(String pax, String? outletId, String tableId) async {
    Map<String, dynamic> data = {
      "pax": int.parse(pax),
      "type": "dine_in",
      "force": true,
      "note": "",
      "outlet_id": "${outletId}",
      "table_id": "${tableCode}",
    };
    debugPrint("$outletId dan  $tableId");
    // var response = await RestServices.createSession(box.read("token"), body);
    // createSessionModel.value = response;

    // if (createSessionModel.value?.status == "awaiting_approval") {
    //   Get.offNamed(RouteName.waiting_page);
    // }

    await BaseResponse<CreateSessionModel>()
        .postData(
            path: ApiEndpoint.SESSION,
            data: data,
            fromJson: createSessionModelFromJson,
            token: box.read("token"))
        .then(
      (res) {
        CreateSessionModel createSessionModel = res;
        EasyLoading.dismiss();

        if (createSessionModel.status == "awaiting_approval") {
          Get.offNamed(RouteName.waiting_page);
        }

        // checkTableSessionModel.value = res!;

        // if (checkTableSessionModel != false) {
        //   EasyLoading.dismiss();
        // getTable(box.read("token"), tableCode);
        // }
        update();
      },
    );
  }

  Future<void> joinSession(String? sessionId) async {
    GlobalHelper.easyLoading();
    Map<String, dynamic> data = {
      "invitation": false,
    };

    await BaseResponse()
        .postData(
            path: ApiEndpoint.SESSION,
            param: "/${sessionId}/join",
            data: data,
            token: box.read("token"))
        .then(
      (res) {
        EasyLoading.dismiss();

        if (res == true) {
          Get.toNamed(RouteName.waiting_page);
        } else {
          EasyLoading.showError("error");
        }

        update();
      },
    );
  }

  void timerDispose() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      timer = null;
    }
  }
}
