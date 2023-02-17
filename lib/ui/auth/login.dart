// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, no_leading_underscores_for_local_identifiers, deprecated_member_use, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:bonbon_new/controllers/login_controller.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/component/primray_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? mySelection = "62";
  List data = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/country_code.json');

    setState(() {
      data = json.decode(response);
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/logo/logo.png',
                        height: 74,
                        width: 57,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        height: 250,
                        decoration: BoxDecoration(),
                        child: SvgPicture.asset(
                          'assets/login/01-start.svg',
                          width: 10,
                          height: 200,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 49.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              color: BaseTheme.main_color, fontSize: 28.sp),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Welcome To Bonbon ',
                              style: TextStyle(
                                  fontFamily: BaseTheme.font_family_sf,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: BaseTheme.font_family_sf),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'It’s easy, just ',
                            ),
                            TextSpan(
                              text: 'login ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'or ',
                            ),
                            TextSpan(
                              text: 'register ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'with your phone number to start ',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Container(
                              width: 88.w,
                              height: 55.h,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 12.h),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                hint: Text(
                                  "Area",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                isExpanded: true,
                                value: mySelection,
                                items: data.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item['country'] +
                                        " (" +
                                        item['code'].toString() +
                                        ")"),
                                    value: item['code'].toString(),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    mySelection = newValue;
                                  });
                                },
                              )),
                          SizedBox(
                            width: 16.w,
                          ),
                          Container(
                            width: 224.w,
                            height: 56.h,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 0),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 14.h),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Phone",
                                hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: BaseTheme.color_grey_7,
                                    fontFamily: BaseTheme.font_family_sf,
                                    fontWeight: FontWeight.w400),
                              ),
                              onChanged: (phone) {
                                loginController.phoneNumber.value = phone;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 72.h,
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
              child: Obx(
                () => PrimaryButton(
                  text: "LOGIN",
                  isValid: loginController.phoneNumber.value.length <= 10
                      ? false
                      : true,
                  onPressed: () {
                    loginController.phoneNumber.value.length <= 10
                        ? null
                        : loginController.otpLogin("+" +
                            mySelection! +
                            loginController.phoneNumber.trim());
                  },
                  fontSize: 16.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
