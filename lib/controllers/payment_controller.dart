import 'dart:convert';

import 'package:bonbon_new/api/base/base_response.dart';
import 'package:bonbon_new/models/order_include_item_menu_model.dart';
import 'package:bonbon_new/models/pay_view_models.dart';
import 'package:bonbon_new/models/virtual_account_models.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xendit/xendit.dart';

class PaymentController extends GetxController {
  // var orderInludeItemModels = OrderIncludeItemModel().obs;
  var orderMeIncludeItemMenuModels = OrderMeIncludeItemMenuModel().obs;
  var payViewModels = PayViewModels().obs;
  var virtualAccountModel = VirtualAccountModels().obs;
  var box = GetStorage();
  var subTotal = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getSessionOrder();
    getPayMentData();
  }

  Future<void> getSessionOrder() async {
    await BaseResponse<OrderMeIncludeItemMenuModel>()
        .getData(
            path: 'order/me?include=item,menu',
            fromJson: orderMeIncludeItemMenuModelFromJson,
            token: box.read("token"))
        .then((response) {
      orderMeIncludeItemMenuModels.value = response!;
      // var a =
      // subTotal = orderMeIncludeItemMenuModels.value.sumCharge +
      //     orderMeIncludeItemMenuModels.value.sumTax +
      //     orderMeIncludeItemMenuModels.value.myNet;
    });
    update();
    sumSubTotal();
  }

  void sumSubTotal() async {
    var myNet = orderMeIncludeItemMenuModels.value.myNet!;
    var sumCharge = orderMeIncludeItemMenuModels.value.sumCharge;
    var sumTax = orderMeIncludeItemMenuModels.value.sumTax;

    subTotal += myNet;
    // subTotal += ;
    subTotal += sumTax;
    print("Subtotal ${subTotal}");
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

  Future<void> getVirtualAccount() async {
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

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}
