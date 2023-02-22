// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print, prefer_const_constructors

import 'dart:async';

import 'package:bonbon_new/api/rest_service.dart';
import 'package:bonbon_new/models/cart_item_mode.dart';
import 'package:bonbon_new/models/me_include_items_model.dart';
import 'package:bonbon_new/models/me_model.dart';
import 'package:bonbon_new/models/menu_lite_model.dart';
import 'package:bonbon_new/models/session_summary_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RestaurantController extends GetxController {
  //models
  Rx<MeModel?> meModel = MeModel().obs;
  Rx<MeIncludeItemModels?> meIncludeItemModels = MeIncludeItemModels().obs;
  Rx<MenuLiteModels?> menuLiteModels = MenuLiteModels().obs;
  Rx<CartItemModels?> cartItemModels = CartItemModels().obs;
  Rx<SessionSummaryModel?> sessionSummaryModel = SessionSummaryModel().obs;

  var box = GetStorage();
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    fetchingMe(box.read("token"));
    fetchingMeIncludeItems(box.read("token"));
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
  }

  Future<void> fetchingMeIncludeItems(String token) async {
    timer = Timer.periodic(Duration(milliseconds: 10000), (Timer t) {
      timerDispose();
      // fetchingMeIncludeItems(token);
      // getMenuLite(meIncludeItemModels.value?.outlet?.id);
      // getCartItem();
      // getSessionSummary();
    });
    var responseMeWithItem = await RestServices.fetchMeIncludeItem(token);
    meIncludeItemModels.value = responseMeWithItem;
    print("Me Include Models ${meIncludeItemModels}");

    await getMenuLite(meIncludeItemModels.value?.outlet?.id);
    await getCartItem();
    await getSessionSummary();
  }

  Future<void> fetchingMe(String token) async {
    var respondMe = await RestServices.fetchMe(token);
    meModel.value = respondMe;
  }

  Future<void> getMenuLite(String? outletId) async {
    var responseMenuLite = await RestServices.fetchOutletMenuLite(
        box.read("token"), meIncludeItemModels.value?.outlet?.id);
    menuLiteModels.value = responseMenuLite;

    print("Menu Lite Models ${meIncludeItemModels.toString()}");
  }

  Future<void> getCartItem() async {
    var responseCartitem = await RestServices.fetchCartItem(box.read("token"));
    cartItemModels.value = responseCartitem;

    print("Cart Item Models ${cartItemModels.toString()}");
  }

  Future<void> getSessionSummary() async {
    var responseSessionSummary =
        await RestServices.fetchSessionSummary(box.read("token"));
    sessionSummaryModel.value = responseSessionSummary;

    print("Session Summary Models ${sessionSummaryModel.toString()}");
  }

  Future<void> addToCart(String? member, String? menuId) async {
    Map<String, dynamic> body = {
      "group": false,
      "member": [member],
      "menu_id": menuId,
      "modifiers": [],
      "notes": "",
      "qty": 1,
    };
    var responseAddTocart =
        await RestServices.addToCart(box.read("token"), body);
    // var responseSessionSummary =
    //     await RestServices.fetchSessionSummary(box.read("token"));
    // sessionSummaryModel.value = responseSessionSummary;

    print("Add to cart ${responseAddTocart.toString()}");
  }

  void timerDispose() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      timer = null;
    }
  }
}
