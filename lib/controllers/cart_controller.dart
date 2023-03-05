// ignore_for_file: avoid_print

import 'package:bonbon_new/api/base/base_response.dart';
import 'package:bonbon_new/api/const/api_endpoint.dart';
import 'package:bonbon_new/api/rest_service.dart';
import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/models/cart_item_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  var cartItemModels = CartItemModels().obs;
  var box = GetStorage();
  var item = [];
  var cartTotal = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getCartItem();
  }

  Future<void> getCartItem() async {
    var responseCartitem = await RestServices.fetchCartItem(box.read("token"));
    cartItemModels.value = responseCartitem!;
    GlobalHelper.easyLoading();

    await BaseResponse<CartItemModels>()
        .getData(
            path: '',
            param:
                'cart-items?include=items,items.item,user,items.modifiers.master,items.members,items.item.images,items.item.modifiers.master',
            fromJson: cartItemModelsFromJson,
            token: box.read("token"))
        .then(
      (res) {
        EasyLoading.dismiss();
        cartItemModels.value = res!;
        item = cartItemModels.value.items!;
        for (var a in cartItemModels.value.items!) {
          cartTotal += a.item!.price! * a.qty!;
        }

        update();
      },
    );

    print("Cart Item Models ${cartItemModels.toString()}");
  }

  Future<void> order() async {
    GlobalHelper.easyLoading();
    Map<String, dynamic> data = {};
    await BaseResponse()
        .postData(
      path: 'order',
      param: '',
      data: data,
      token: box.read("token"),
    )
        .then(
      (res) {
        if (res == true) {
          print("Rest ${res.toString()}");
          EasyLoading.showSuccess("Order Placed");

          // Get.back();
          // Get.back();)
        } else {
          print(res.toString());
          EasyLoading.showError("Order Not Placed ${res.toString()}");
        }

        update();
      },
    );

    print("Cart Item Models ${cartItemModels.toString()}");
  }
}
