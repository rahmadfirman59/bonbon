// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/controllers/create_account_controller.dart';
import 'package:bonbon_new/routes/routes_name.dart';
import 'package:bonbon_new/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../component/primray_button.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateAccountController createAccountController =
        Get.put(CreateAccountController());
    FocusNode myFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Create Account",
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
                height: 32.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  width: 328.w,
                  height: 56.h,
                  child: TextField(
                    focusNode: myFocusNode,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Full name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Colors.grey, width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Colors.grey, width: 0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 14.h),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Full name",
                      hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: BaseTheme.color_grey_7,
                          fontFamily: BaseTheme.font_family_sf,
                          fontWeight: FontWeight.w400),
                    ),
                    onChanged: (phone) {
                      // loginController.phoneNumber.value = phone;
                      // debugPrint(loginController.phoneNumber.value);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Text(
                  "Please tell us your name",
                  style: TextStyle(
                      color: BaseTheme.color_grey_7,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: BaseTheme.font_family_open),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  width: 328.w,
                  height: 56.h,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Birthday",
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: BaseTheme.color_grey_8,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Colors.grey, width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Colors.grey, width: 0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 14.h),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Birthday",
                      hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: BaseTheme.color_grey_7,
                          fontFamily: BaseTheme.font_family_sf,
                          fontWeight: FontWeight.w400),
                    ),
                    onChanged: (phone) {
                      // loginController.phoneNumber.value = phone;
                      // debugPrint(loginController.phoneNumber.value);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text('Gender',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                          fontFamily: BaseTheme.font_family_sf,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: createAccountController.gender,
                      onChanged: (val) {
                        // setState(() {
                        //   radioButtonItem = 'ONE';
                        //   id = 1;
                        // });
                      },
                    ),
                    Text('Male',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                          fontFamily: BaseTheme.font_family_sf,
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    Radio(
                      value: 2,
                      groupValue: createAccountController.gender,
                      onChanged: (val) {
                        // setState(() {
                        //   radioButtonItem = 'TWO';
                        //   id = 2;
                        // });
                      },
                    ),
                    Text(
                      'Female',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontFamily: BaseTheme.font_family_sf,
                      ),
                    ),
                  ],
                ),
              ),
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
                text: "Save",
                isValid: false,
                onPressed: () {
                  Get.toNamed(RouteName.create_account_success);
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
