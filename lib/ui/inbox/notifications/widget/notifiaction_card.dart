// ignore_for_file: prefer_const_constructors

import 'package:bonbon_new/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? subtitle;
  final bool? isRead;
  const NotificationCard({
    Key? key,
    this.icon,
    this.title,
    this.subtitle,
    this.isRead = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isRead == false
          ? BoxDecoration(color: Colors.white)
          : BoxDecoration(color: BaseTheme.soft_color),
      child: ListTile(
        leading: isRead == true
            ? Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.yellow,
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ))
            : Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFBFBFBF),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
        title: Text(
          title ?? "",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: BaseTheme.font_family_sf,
          ),
        ),
        subtitle: Text(
          subtitle ?? "",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: BaseTheme.font_family_sf,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right_outlined,
          color: BaseTheme.color_grey_8,
        ),
      ),
    );
  }
}
