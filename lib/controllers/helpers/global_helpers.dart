// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animations/loading_animations.dart';

class GlobalHelper extends GetxController {
  static final timeFormat = DateFormat('hh:mm');
  static easyLoading() {
    EasyLoading.show(
      status: 'Loading...',
      indicator: LoadingBouncingGrid.square(
        borderSize: 3.0,
        size: 30.0,
        backgroundColor: Colors.white,
        duration: Duration(milliseconds: 1000),
      ),
    );
  }
}
