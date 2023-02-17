// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bonbon_new/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:line_icons/line_icons.dart';

class BookOrderFilter extends StatelessWidget {
  const BookOrderFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(40),
            ),
            width: 85,
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  LineIcons.filter,
                  color: Colors.blue,
                ),
                Center(
                  child: Text(
                    "Filters",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.sp,
                      fontFamily: BaseTheme.font_family_sf,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFC7FFE4),
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(40),
            ),
            width: 77,
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Active",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontFamily: ('SanFransisco'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(40),
              ),
              width: 77,
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Past Booking",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontFamily: ('SanFransisco'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(40),
            ),
            width: 77,
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Others",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: ('SanFransisco'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
