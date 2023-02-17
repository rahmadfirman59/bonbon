// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/controllers/index_controller.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/inbox/book_order/widget/book_order_card.dart';
import 'package:bonbon_new/ui/inbox/book_order/widget/book_order_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class BookOrder extends StatelessWidget {
  const BookOrder({Key? key}) : super(key: key);

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
          "Book Order",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              fontFamily: BaseTheme.font_family_open),
        ),
      ),
      body: ListView(
        children: [
          BookOrderFilter(),
          BookOrderCard(
            icon: LineIcons.book,
            title: "Booking Takeaway Harlem Burger",
            subtitle: "Tuesday, 24 Dec 2021 • 12.30",
            isRead: true,
          ),
          BookOrderCard(
            icon: LineIcons.book,
            title: "Booking Sushi Ghin",
            subtitle: "Tuesday, 24 Dec 2021 • 18.30",
            isRead: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Previous",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: ('SanFransisco'),
                  ),
                ),
              ],
            ),
          ),
          BookOrderCard(
            icon: LineIcons.book,
            title: "Booking Takeaway Harlem Burger",
            subtitle: "Tuesday, 18 Dec 2021 • 12.30",
            isRead: false,
          ),
          BookOrderCard(
            icon: LineIcons.book,
            title: "Booking Takeaway Harlem Burger",
            subtitle: "Tuesday, 18 Dec 2021 • 12.30",
            isRead: false,
          ),
        ],
      ),
    );
  }
}
