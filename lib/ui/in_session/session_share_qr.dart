// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/component/primray_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class SessionShareQr extends StatelessWidget {
  const SessionShareQr({Key? key}) : super(key: key);

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
          "Share QR Codes",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              fontFamily: BaseTheme.font_family_open),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 55.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: PrettyQr(
                  image: AssetImage('assets/logo/logo.png'),
                  size: 240,
                  data: 'https://www.google.ru',
                  errorCorrectLevel: QrErrorCorrectLevel.M,
                  typeNumber: null,
                  roundEdges: true,
                ),
              ),
              SizedBox(
                height: 31.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontFamily: BaseTheme.font_family_open),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Show your friends this QR to Join the Table \n',
                        style: TextStyle(
                            color: Color(0xFF606060),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: 'or give them the table code ',
                        style: TextStyle(
                            color: Color(0xFFA8A8A8),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 31.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: Container(
                  width: 328.w,
                  height: 56.h,
                  child: TextField(
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    // controller: scanController.tableCodeController,

                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.copy),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Colors.grey, width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Colors.grey, width: 0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Code",
                      hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: BaseTheme.color_grey_7,
                          fontFamily: BaseTheme.font_family_sf,
                          fontWeight: FontWeight.w400),
                    ),
                    onChanged: (tableCode) {
                      print(tableCode);
                    },
                  ),
                ),
              ),
              // SizedBox(
              //   height: 200,
              // ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: PrimaryButton(
                text: "Share",
                isValid: true,
                onPressed: () {
                  // Get.toNamed(RouteName.create_account);
                },
                fontSize: 16.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
