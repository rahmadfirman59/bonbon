// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChooseSession extends StatelessWidget {
  const ChooseSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Table Session",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              fontFamily: BaseTheme.font_family_open),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                    color: BaseTheme.color_grey_8,
                    fontSize: 14.sp,
                    fontFamily: BaseTheme.font_family_sf,
                    fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                    text: 'There’s multiple session opened at this table,',
                  ),
                  TextSpan(
                    text: 'would you like join existing session or create new ',
                  ),
                  TextSpan(
                    text: 'sessions',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
