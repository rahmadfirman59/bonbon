// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/controllers/otp_controller.dart';

import 'package:bonbon_new/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../component/primray_button.dart';

class Otp extends StatelessWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtpController otpController = Get.put(OtpController());
    final defaultPinTheme = PinTheme(
      width: 40,
      height: 40,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 61, 132, 191)),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromARGB(255, 22, 26, 29)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Enter OTP Codes",
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
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 77.w),
                  child: Container(
                    width: 204.w,
                    height: 164.h,
                    child: SvgPicture.asset(
                      'assets/login/02-otp.svg',
                      width: 10,
                      height: 200,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: BaseTheme.color_grey_8,
                          fontSize: 14.sp,
                          fontFamily: BaseTheme.font_family_sf,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'We have sent verification code to your phone number ',
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
                          color: BaseTheme.color_grey_8,
                          fontSize: 14.sp,
                          fontFamily: BaseTheme.font_family_sf,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Please enter verification code',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    showCursor: true,
                    separator: Container(
                      height: 40,
                      width: 15,
                      color: Colors.white,
                    ),
                    onCompleted: (pin) {
                      otpController.otpValid.value = true;
                      // controller.login(Get.parameters['phoneNumber'],
                      //     controller.otpfield.value);
                    },
                    onChanged: (value) {
                      otpController.otpfield.value = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 27.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "if you haven’t got OTP please wait ",
                        style: TextStyle(color: BaseTheme.color_grey_8),
                      ),
                      Obx(
                        () => Text(
                          "${otpController.seconds}",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xFF00CC36),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        " sec",
                        style: TextStyle(color: BaseTheme.color_grey_8),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.h,
                ),
                Obx(() => TextButton(
                      onPressed: () {
                        otpController.wait.value
                            ? null
                            : otpController.resendOtp(
                                Get.parameters['phone'],
                              );
                      },
                      child: Text(
                        "Resend code",
                        style: TextStyle(
                          color: otpController.wait.value
                              ? BaseTheme.color_grey_6
                              : BaseTheme.main_color,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: BaseTheme.font_family_sf,
                        ),
                      ),
                    )),
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
                child: Obx(() => PrimaryButton(
                      text: "Next",
                      isValid: otpController.otpfield.value.length < 6
                          ? false
                          : true,
                      onPressed: () {
                        otpController.otpfield.value.length < 6
                            ? null
                            : otpController.login(Get.parameters["phone"],
                                otpController.otpfield.value);
                        // Get.toNamed(RouteName.create_account);
                      },
                      fontSize: 16.sp,
                    )),
              ),
            )
          ],
        ));
  }
}
