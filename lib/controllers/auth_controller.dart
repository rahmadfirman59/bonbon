import 'package:bonbon_new/api/rest_service.dart';
import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/models/me_model.dart';
import 'package:bonbon_new/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  static GetStorage box = GetStorage();
  String? getToken() => box.read('token');
  Rx<MeModel?> meModel = MeModel().obs;

  @override
  void onInit() {
    debugPrint('token-->${getToken()}');
    super.onInit();
  }

  loginBinding() async {
    if (getToken() == null) {
      Get.offAllNamed(RouteName.login);
    } else {
      // fetch api
      GlobalHelper.easyLoading();
      await fetchingMe(box.read("token"))
          .then((value) => EasyLoading.dismiss());
    }
  }

  Future<void> fetchingMe(String token) async {
    var respondMe = await RestServices.fetchMe(token);
    meModel.value = respondMe;
  }
}
