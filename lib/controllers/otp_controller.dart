// ignore_for_file: unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:bonbon_new/api/rest_service.dart';
import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/models/login_model.dart';
import 'package:bonbon_new/models/me_model.dart';

import 'package:bonbon_new/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OtpController extends GetxController {
  //auth
  Rx<String> userToken = ''.obs;
  var box = GetStorage();

  static const maxSecond = 30;
  var seconds = maxSecond.obs;
  var wait = false.obs;
  var otpValid = false.obs;
  var otpfield = "".obs;
  Timer? timer;

  Rx<LoginModel?> loginModel = LoginModel().obs;
  Rx<MeModel?> meModel = MeModel().obs;

  @override
  void onInit() {
    super.onInit();
    debugPrint("${wait}");
  }

  @override
  void onReady() {
    super.onReady();
    starTimer();
    wait.value = true;
  }

  void starTimer() {
    debugPrint("${seconds}");
    wait.value = true;
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0) {
        seconds--;
      } else {
        stoptimer();
      }
    });
  }

  void stoptimer() {
    wait.value = false;
    timer!.cancel();
  }

  resendOtp(String? phoneNumber) async {
    GlobalHelper.easyLoading();

    Map<String, dynamic> body = {
      "phone": phoneNumber,
    };
    seconds.value = maxSecond;
    var response = await RestServices.loginOtp(body);

    if (response == true) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("OTP Send");
    } else {
      EasyLoading.dismiss();
      EasyLoading.showError("Error " + response.toString());
    }
    starTimer();
  }

  Future<void> login(String? phoneNumber, String? otp) async {
    Map<String, dynamic> body = {"phone": phoneNumber ?? "", "otp": otp ?? ""};

    var response = await RestServices.login(body);

    if (response?.accessToken != null) {
      box.write('token', response?.accessToken);
      userToken.value = box.read("token");
      await fetchingMe(box.read("token"));
      Get.offAllNamed(RouteName.root);
      loginModel.value = response;
    } else {
      Get.snackbar(
        'Invalid',
        'The OTP code you entered is invalid (p.s its 1-6)',
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black,
        shouldIconPulse: true,
      );
    }
  }

  Future<void> fetchingMe(String token) async {
    var respondMe = await RestServices.fetchMe(token);
    meModel.value = respondMe;
  }
}
