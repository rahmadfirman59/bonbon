// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:bonbon_new/controllers/waiting_controller.dart';
import 'package:bonbon_new/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WaitingPage extends StatelessWidget {
  const WaitingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final waitinPageController = Get.put(WaitingController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_6yhhrbk6.json'),
        Text(
          "Please Wait",
          style: TextStyle(
              fontFamily: BaseTheme.font_family_sf,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        Text("New Session is being approved",
            style: TextStyle(
                fontFamily: BaseTheme.font_family_sf,
                fontSize: 15,
                fontWeight: FontWeight.w400))
      ],
    );
  }
}
