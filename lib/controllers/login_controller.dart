// ignore_for_file: unnecessary_overrides, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'dart:convert';

import 'package:bonbon_new/api/base/base_response.dart';
import 'package:bonbon_new/api/const/api_endpoint.dart';

import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/routes/routes_name.dart';

import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var mySelection = "62".obs;
  List<dynamic> dataDropdwo = [].obs;

  final phoneNumber = "".obs;

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/country_code.json');

    dataDropdwo = await json.decode(response);

    update();
  }

  @override
  void onInit() {
    super.onInit();

    readJson();
    mySelection.value = "62";
  }

  @override
  void onClose() {
    super.onClose();
  }

  otpLogin(String? phoneNumber) async {
    GlobalHelper.easyLoading();

    Map<String, String> data = {
      "phone": phoneNumber ?? "",
    };

    await BaseResponse<bool>()
        .postData(
      path: ApiEndpoint.REQUEST_OTP,
      data: data,
    )
        .then(
      (res) {
        if (res == true) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess("OTP Send");
          Get.toNamed(RouteName.otp, parameters: data);
        }
      },
    );
  }
}
