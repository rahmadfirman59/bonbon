// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bonbon_new/controllers/index_controller.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/inbox/notifications/widget/notifiaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IndexController indexController = Get.put(IndexController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            indexController.currentIndex.value = 0;
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Notification",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              fontFamily: BaseTheme.font_family_open),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
            child: Icon(
              LineIcons.verticalEllipsis,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              children: [
                Text(
                  "Today",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: ('SanFransisco'),
                  ),
                ),
              ],
            ),
          ),
          NotificationCard(
            icon: Icons.percent,
            title: "Discount up to 80% hanya untukmu",
            subtitle:
                "Yuk segera booking restoran premium favoritmu sekarang juga",
            isRead: true,
          ),
          NotificationCard(
            icon: LineIcons.creditCard,
            title: "Payment with credit cards",
            subtitle:
                "Yuk segera booking restoran premium favoritmu sekarang juga",
            isRead: true,
          ),
          NotificationCard(
            icon: LineIcons.star,
            title: "Restaurant need review",
            subtitle:
                "Yuk segera booking restoran premium favoritmu sekarang juga",
            isRead: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              children: [
                Text(
                  "Yesterday",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: ('SanFransisco'),
                  ),
                ),
              ],
            ),
          ),
          NotificationCard(
            icon: LineIcons.exclamationTriangle,
            title: "Attention you need to take your food",
            subtitle:
                "Yuk segera booking restoran premium favoritmu sekarang juga",
            isRead: false,
          ),
          NotificationCard(
            icon: LineIcons.book,
            title: "Booking for takeaway is created",
            subtitle:
                "Yuk segera booking restoran premium favoritmu sekarang juga",
            isRead: false,
          ),
          NotificationCard(
            icon: LineIcons.infoCircle,
            title: "Server maintenance",
            subtitle:
                "Yuk segera booking restoran premium favoritmu sekarang juga",
            isRead: false,
          ),
        ],
      ),
    );
  }
}
