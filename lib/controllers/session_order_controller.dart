import 'package:bonbon_new/api/base/base_response.dart';
import 'package:bonbon_new/models/order_include_item_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SessionOrderController extends GetxController {
  var orderInludeItemModels = OrderIncludeItemModel().obs;
  var box = GetStorage();
  var order = [];
  var ordertype = ["for_all", "only_me"].obs;
  var orderTitletype = ["Shared Order ", "My Order"].obs;
  @override
  void onInit() {
    super.onInit();
    getSessionOrder();
  }

  Future<void> getSessionOrder() async {
    await BaseResponse<OrderIncludeItemModel>()
        .getData(
            path: 'order?include=item',
            fromJson: orderIncludeItemModelFromJson,
            token: box.read("token"))
        .then((response) {
      orderInludeItemModels.value = response!;
    });
    update();
  }
}
