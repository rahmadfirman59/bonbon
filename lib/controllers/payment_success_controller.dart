import 'package:bonbon_new/api/base/base_response.dart';
import 'package:bonbon_new/models/payment_summary_models.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PaymentSuccessController extends GetxController {
  var paymentSummaryModels = PaymentSummaryModels().obs;
  var box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getSessionOrder();
  }

  Future<void> getSessionOrder() async {
    await BaseResponse<PaymentSummaryModels>()
        .getData(
            path: 'payment/summary',
            fromJson: paymentSummaryModelsFromJson,
            token: box.read("token"))
        .then((response) {
      paymentSummaryModels.value = response!;
    });
    update();
  }
}
