// ignore_for_file: avoid_print

import 'package:bonbon_new/api/rest_service.dart';
import 'package:bonbon_new/models/cart_item_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  Rx<CartItemModels?> cartItemModels = CartItemModels().obs;
  var box = GetStorage();
  var cartTotal = 00;

  @override
  void onInit() {
    super.onInit();
    getCartItem();
  }

  Future<void> getCartItem() async {
    var responseCartitem = await RestServices.fetchCartItem(box.read("token"));
    cartItemModels.value = responseCartitem;

    print("Cart Item Models ${cartItemModels.toString()}");
  }
}
