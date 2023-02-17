// ignore_for_file: prefer_const_constructors

import 'package:bonbon_new/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.fontSize,
      required this.isValid})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final double fontSize;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: isValid == true
              ? ElevatedButton.styleFrom(
                  primary: Color(0xFF00CC36),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  padding: EdgeInsets.all(15) //content padding inside button
                  )
              : ElevatedButton.styleFrom(
                  primary: BaseTheme.color_grey_4,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  padding: EdgeInsets.all(15) //content padding inside button
                  ),
          onPressed: () {
            // Get.toNamed(Routes.OTP);
            onPressed();
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: ('SanFransisco'),
            ),
          ),
        ),
      ),
    );
  }
}
