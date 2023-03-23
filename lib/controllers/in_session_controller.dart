// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, avoid_print, unrelated_type_equality_checks

import 'dart:async';

import 'package:bonbon_new/api/base/base_response.dart';
import 'package:bonbon_new/api/const/api_endpoint.dart';

import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/models/cart_item_model.dart';
import 'package:bonbon_new/models/me_include_items_model.dart';
import 'package:bonbon_new/models/me_model.dart';
import 'package:bonbon_new/models/menu_lite_model.dart';
import 'package:bonbon_new/models/session_summary_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InSessionController extends GetxController {
  TextEditingController notesController = TextEditingController();
  var meModel = MeModel().obs;
  var meIncludeItemModels = MeIncludeItemModels().obs;
  var menuLiteModels = MenuLiteModels().obs;
  var cartItemModels = CartItemModels().obs;
  var sessionSummaryModel = SessionSummaryModel().obs;

  var leaderName = [].obs;
  var requestJoin = 0.obs;

  var modifiers = [].obs;
  var listView = true.obs;

  var box = GetStorage();
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    fetchingMe(box.read("token"));
    fetchingMeIncludeItems(box.read("token"));
    print("Modifiers ${modifiers} ");
    modifiers.clear();
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
      // getMenuLite(meIncludeItemModels.value.outlet?.id);
      // getCartItem();
      // getSessionSummary();
    });
    // var responseMeWithItem = await RestServices.fetchMeIncludeItem(token);
    // meIncludeItemModels.value = responseMeWithItem!;

    await BaseResponse<MeIncludeItemModels>()
        .getData(
            path: '',
            param: "order/me?include=items",
            fromJson: meIncludeItemModelsFromJson,
            token: box.read("token"))
        .then((response) {
      meIncludeItemModels.value = response!;
    });

    print("Me Include Models ${meIncludeItemModels}");

    await getMenuLite(meIncludeItemModels.value.outlet?.id);
    await getCartItem();
    await getSessionSummary();
  }

  Future<void> fetchingMe(String token) async {
    // var respondMe = await RestServices.fetchMe(token);
    // meModel.value = respondMe;

    await BaseResponse<MeModel>()
        .getData(
      path: ApiEndpoint.AUTH_ME,
      fromJson: meModelFromJson,
      token: box.read("token"),
    )
        .then((response) {
      meModel.value = response!;

      // if (meModel.value.session) {}
    });
  }

  Future<void> getMenuLite(String? outletId) async {
    // var responseMenuLite = await RestServices.fetchOutletMenuLite(
    //     box.read("token"), meIncludeItemModels.value?.outlet?.id);
    // menuLiteModels.value = responseMenuLite;

    await BaseResponse<MenuLiteModels>()
        .getData(
            path: ApiEndpoint.OUTLET,
            param: "/${outletId}/menu-lite",
            fromJson: menuLiteModelsFromJson,
            token: box.read("token"))
        .then((response) {
      menuLiteModels.value = response!;
    });

    // print("Menu Lite Models ${meIncludeItemModels.toString()}");
  }

  Future<void> getCartItem() async {
    // var responseCartitem = await RestServices.fetchCartItem(box.read("token"));
    // cartItemModels.value = responseCartitem!;

    await BaseResponse<CartItemModels>()
        .getData(
            path: '',
            param:
                "cart-items?include=items,items.item,user,items.modifiers.master,items.members,items.item.images,items.item.modifiers.master",
            fromJson: cartItemModelsFromJson,
            token: box.read("token"))
        .then((response) {
      cartItemModels.value = response!;
    });

    print("Cart Item Models ${cartItemModels.toString()}");
  }

  Future<void> getSessionSummary() async {
    // var responseSessionSummary =
    //     await RestServices.fetchSessionSummary(box.read("token"));
    // sessionSummaryModel.value = responseSessionSummary;

    await BaseResponse<SessionSummaryModel>()
        .getData(
            path: '',
            param:
                "session/summary?include=members.user,orders.item,orders.members,table,outlet&type=active",
            fromJson: sessionSummaryModelFromJson,
            token: box.read("token"))
        .then((response) {
      sessionSummaryModel.value = response!;
    });

    leaderName.value = sessionSummaryModel.value.members!.where(
      (element) {
        var lead = element.isLeader == true;
        print("Leader Name ${element.user?.name}");
        return lead;
      },
    ).toList();

    requestJoin.value = 0;
    sessionSummaryModel.value.members!.where((element) {
      var pending = element.status == "pending";
      if (pending) {
        requestJoin += 1;
      }
      return pending;
    }).toList();
    print("Session Summary Models ${sessionSummaryModel.toString()}");
    print("Pending Member ${requestJoin}");
  }

  Future<void> addToCart(bool? group, String? member, String? menuId,
      String? notes, int? qty) async {
    GlobalHelper.easyLoading();
    Map<String, dynamic> body = {
      "group": group,
      "members": [member],
      "menu_id": menuId,
      "modifiers": [],
      "note": notes,
      "qty": qty,
    };
    // var responseAddTocart =
    //     await RestServices.addToCart(box.read("token"), body);
    // EasyLoading.dismiss();

    await BaseResponse<bool>()
        .postData(
      path: '',
      param: "cart-items",
      data: body,
      token: box.read("token"),
    )
        .then((response) {
      if (response != false) {
        EasyLoading.showSuccess("Added to cart");
        Get.back();
      } else {
        EasyLoading.showError("Error ${response.toString()}");
      }
    });

    // print("Add to cart ${responseAddTocart.toString()}");
  }

  Future<void> action(
      String? memberId, String? memberName, String? action) async {
    GlobalHelper.easyLoading();
    Map<String, dynamic> body = {
      "type": action,
    };

    await BaseResponse<bool>()
        .postData(
      path: '',
      param: "session/member/${memberId}/action",
      data: body,
      token: box.read("token"),
    )
        .then((response) {
      if (response != false) {
        EasyLoading.showSuccess("${memberName} ${action}");
        Get.back();
      } else {
        EasyLoading.showError("Error ${response.toString()}");
      }
    });

    // print("Add to cart ${responseAddTocart.toString()}");
  }

  void timerDispose() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      timer = null;
    }
  }
}
