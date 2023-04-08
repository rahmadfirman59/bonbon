import 'package:bonbon_new/api/base/base_response.dart';
import 'package:bonbon_new/models/order_include_item_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SessionOrderController extends GetxController {
  var orderInludeItemModels = OrderIncludeItemModel().obs;
  var box = GetStorage();
  var order = [];
  var ordertype = ["for_all", "for_member", "only_me"].obs;
  var orderTitletype = ["Shared Order", "My Order"].obs;
  List<bool> isExpanded = <bool>[].obs;

  var status = [
    "Split Bill",
    "Host the Meal",
  ].obs;
  var statusSet = "Split Bill".obs;

  // bool isExpanded = false;

  @override
  void onInit() {
    super.onInit();
    getSessionOrder();
  }

  void chngeIcon(int index, bool value) {
    isExpanded[index] = value;
    update();
  }

  void pushDataFalse() async {
    for (var element in orderInludeItemModels.value.orders!) {
      isExpanded.add(false);
    }
    // isChecked = List<bool>.filled(menuElement.length, false);
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
