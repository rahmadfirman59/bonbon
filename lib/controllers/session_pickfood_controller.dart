// ignore_for_file: unnecessary_overrides, unrelated_type_equality_checks

import 'package:bonbon_new/api/base/base_response.dart';
import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/models/session_summary_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SessionPickFoodController extends GetxController {
  TextEditingController notesController = TextEditingController();
  var box = GetStorage();
  var modifiers = [].obs;
  var count = 0.obs;
  var status = ["Only Me", "Group", "Shared With"].obs;
  var statusSet = "Only Me".obs;
  List<Member> sessionMember = <Member>[].obs;
  List<dynamic> menuElement = [].obs;
  List<bool> isChecked = <bool>[].obs;

  var checkedMember = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    pushDataFalse();
    print("Session Member ${sessionMember.toString()}");
    print("Session Member ${checkedMember.toString()}");
  }

  void pushDataFalse() async {
    for (var element in sessionMember) {
      Map<String, dynamic> body = {
        "id": element.id,
        "nama": element.user?.name,
      };
      menuElement.add(body);

      if (element.user?.id == box.read("user_id")) {
        isChecked.add(true);
        checkedMember.add(element.id ?? "");
      } else {
        isChecked.add(false);
      }

      // checkedMember.add
      //(false);
    }
    // isChecked = List<bool>.filled(menuElement.length, false);
  }

  void changeCheckedMember(bool? value, int index) {
    print("Index ${index}");

    // checkedMember[index] = value!;
    update();
  }

  void increment() {
    count++;
  }

  void decrement() {
    if (count != 0) {
      count--;
    }
  }

  void addOrRemoveModifiers(String? modifiersId) async {
    var foundPeople = modifiers.where((element) => element == modifiersId);
    if (foundPeople.isEmpty) {
      modifiers.add(modifiersId);
    } else {
      modifiers.remove(modifiersId);
    }

    debugPrint(modifiers.toString());
  }

  void addOrRemoveMember(String memberId) {
    var foundMember = checkedMember.where((element) => element == memberId);
    if (foundMember.isEmpty) {
      checkedMember.add(memberId);
    } else {
      checkedMember.remove(memberId);
    }
    print(checkedMember);
  }

  checkModifiers(String? modifiersId) {
    var foundPeople = modifiers.where((element) => element == modifiersId);
    if (foundPeople.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addToCart(var orderType, List member, String? menuId,
      String? notes, int? qty) async {
    GlobalHelper.easyLoading();

    Map<String, dynamic> body;
    if (orderType == "Group") {
      body = {
        "group": true,
        "members": [],
        "menu_id": menuId,
        "modifiers": modifiers,
        "note": notes,
        "qty": qty,
      };
    } else if (orderType == "Only Me") {
      var memberId = member
          .where((element) => element.user.id == box.read("user_id"))
          .toList();

      body = {
        "group": false,
        "members": [memberId[0].id],
        "menu_id": menuId,
        "modifiers": modifiers,
        "note": notes,
        "qty": qty,
      };
    } else {
      body = {
        "group": false,
        "members": checkedMember,
        "menu_id": menuId,
        "modifiers": [],
        "note": notes,
        "qty": qty,
      };
    }

    // var responseAddTocart =
    //     await RestServices.addToCart(box.read("token"), body);
    // EasyLoading.dismiss();
    debugPrint(body.toString());
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
}
