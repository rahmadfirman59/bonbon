// ignore_for_file: unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:bonbon_new/api/base/base_response.dart';
import 'package:bonbon_new/api/const/api_endpoint.dart';
import 'package:bonbon_new/api/const/sim_error.dart';

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

  var meModel = MeModel().obs;

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

    Map<String, dynamic> data = {
      "phone": phoneNumber,
    };
    seconds.value = maxSecond;
    // var response = await RestServices.loginOtp(body);

    // if (response == true) {
    //   EasyLoading.dismiss();
    //   EasyLoading.showSuccess("OTP Send");
    // } else {
    //   EasyLoading.dismiss();
    //   EasyLoading.showError("Error " + response.toString());
    // }
    await BaseResponse()
        .postData(
      path: ApiEndpoint.REQUEST_OTP,
      data: data,
    )
        .then(
      (res) {
        if (res == true) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess("OTP Send");
        }
      },
    );
    starTimer();
  }

  Future<void> login(String? phoneNumber, String? otp) async {
    GlobalHelper.easyLoading();
    Map<String, dynamic> data = {"phone": phoneNumber ?? "", "otp": otp ?? ""};

    await BaseResponse<LoginModel>()
        .postData(
      path: ApiEndpoint.OTP_LOGIN,
      data: data,
      fromJson: loginModelFromJson,
    )
        .then(
      (res) {
        LoginModel response = res;
        if (response.accessToken != null) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess("OTP Valid");
          box.write('token', response.accessToken);
          fetchingMe(box.read("token"));
          Get.offAllNamed(RouteName.root);
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
      },
    );

    // var response = await RestServices.login(body);

    // if (response?.accessToken != null) {
    //   box.write('token', response?.accessToken);
    //   userToken.value = box.read("token");
    //   await fetchingMe(box.read("token"));
    //   Get.offAllNamed(RouteName.root);
    //   loginModel.value = response;
    // } else {
    // Get.snackbar(
    //   'Invalid',
    //   'The OTP code you entered is invalid (p.s its 1-6)',
    //   colorText: Colors.white,
    //   snackPosition: SnackPosition.TOP,
    //   backgroundColor: Colors.black,
    //   shouldIconPulse: true,
    // );
    // }
  }

  Future<void> fetchingMe(String token) async {
    // var respondMe = await RestServices.fetchMe(token);
    // meModel.value = respondMe;

    await BaseResponse<MeModel>()
        .getData(
            path: ApiEndpoint.AUTH_ME,
            fromJson: meModelFromJson,
            token: box.read("token"))
        .then(
          (response) => response != null
              ? meModel.value = response
              : EasyLoading.showInfo('${SimError.APIERROR}'),
        );
    update();
  }
}
