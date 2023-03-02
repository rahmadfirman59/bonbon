// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:bonbon_new/api/base/base_response.dart';
import 'package:bonbon_new/api/const/api_endpoint.dart';

import 'package:bonbon_new/models/me_model.dart';
import 'package:bonbon_new/routes/routes_name.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WaitingController extends GetxController {
  Rx<MeModel?> meModel = MeModel().obs;
  var box = GetStorage();
  Timer? timer;
  @override
  void onInit() {
    super.onInit();
    fetchingMe(box.read("token"));
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
  }

  Future<void> fetchingMe(String token) async {
    timer = Timer.periodic(Duration(milliseconds: 5000), (Timer t) {
      timerDispose();
      fetchingMe(token);
    });
    await BaseResponse<MeModel>()
        .getData(
            path: ApiEndpoint.AUTH_ME,
            fromJson: meModelFromJson,
            token: box.read("token"))
        .then((response) {
      meModel.value = response;

      if (meModel.value?.session == "active") {
        Get.offAllNamed(RouteName.in_session);
      } else if (meModel.value?.session == "completed") {
        Get.offAllNamed(RouteName.home);
      }
    });
    // var respondMe = await RestServices.fetchMe(token);
    // meModel.value = respondMe;

    // if (meModel.value?.session == "completed") {
    //   Get.offAllNamed(RouteName.home);
    // } else if (meModel.value?.session == "active") {
    //   Get.offAllNamed(RouteName.in_session);
    // }
  }

  void timerDispose() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      timer = null;
    }
  }
}
