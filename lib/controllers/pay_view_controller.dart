import 'package:bonbon_new/api/base/base_response.dart';
import 'package:bonbon_new/models/pay_view_models.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PayViewController extends GetxController {
  var payViewModels = PayViewModels().obs;
  var box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    getPayMentData();
  }

  Future<void> getPayMentData() async {
    Map<String, dynamic> data = {};
    await BaseResponse<PayViewModels>()
        .postData(
            path: 'order/pay',
            param: '',
            data: data,
            fromJson: payViewModelsFromJson,
            token: box.read("token"))
        .then((response) {
      payViewModels.value = response!;
    });
    update();
  }
}
