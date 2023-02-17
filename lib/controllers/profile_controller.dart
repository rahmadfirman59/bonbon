import 'package:bonbon_new/api/rest_service.dart';
import 'package:bonbon_new/models/me_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Profilecontroller extends GetxController {
  Rx<MeModel?> meModel = MeModel().obs;
  var box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    fetchingMe(box.read("token"));
  }

  Future<void> fetchingMe(String token) async {
    var respondMe = await RestServices.fetchMe(token);
    meModel.value = respondMe;
  }
}
