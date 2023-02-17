// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/component/primray_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateAccounSuccess extends StatelessWidget {
  const CreateAccounSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                  child: Column(
                children: [
                  SizedBox(
                    height: 113.h,
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      height: 250,
                      child: SvgPicture.asset(
                        'assets/login/success.svg',
                        width: 10,
                        height: 200,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44.w),
                    child: Text(
                      "Registration Success",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: BaseTheme.font_family_open),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44.sp),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: BaseTheme.color_grey_8,
                            fontSize: 14.sp,
                            fontFamily: BaseTheme.font_family_sf),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'You will experience amazing things',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44.sp),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: BaseTheme.color_grey_8,
                            fontSize: 14.sp,
                            fontFamily: BaseTheme.font_family_sf),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Splitting the bill has never been so easy.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ),
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
                  text: "Go to Home",
                  isValid: true,
                  onPressed: () {},
                  fontSize: 16.sp,
                ),
              ))
        ],
      ),
    );
  }
}
