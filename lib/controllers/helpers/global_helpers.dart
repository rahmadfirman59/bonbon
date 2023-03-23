// ignore_for_file: prefer_const_constructors

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GlobalHelper extends GetxController {
  static final timeFormat = DateFormat('hh:mm');
  static easyLoading() {
    EasyLoading.show(
      status: 'Waiting..',
    );
  }

  static String formatNumber(String n) =>
      NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: '')
          .format(double.parse(n));
  static String get currency =>
      NumberFormat.compactSimpleCurrency(locale: 'IDR').currencySymbol;
}
