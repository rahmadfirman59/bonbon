// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:bonbon_new/controllers/auth_controller.dart';

import 'package:bonbon_new/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'ui/auth/login.dart';

class Root extends GetWidget<AuthController> {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return AuthController.box.read("token") == null ? Login() : Index();
  }
}
