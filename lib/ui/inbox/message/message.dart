// ignore_for_file: prefer_const_constructors

import 'package:bonbon_new/controllers/index_controller.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/inbox/message/widget/message_card.dart';
import 'package:bonbon_new/ui/inbox/message/widget/message_filter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

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
          "Message",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              fontFamily: BaseTheme.font_family_open),
        ),
      ),
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          MessageFilter(),
          MessageCard(
            image: 'assets/message_picture/1.png',
            title: "Ralph Edwards",
            subtitle:
                "Yuk segera booking restoran premium favoritmu sekarang juga..",
            isRead: true,
            trailing: "10.34",
          ),
          MessageCard(
            image: 'assets/message_picture/2.png',
            title: "Theresa Webb",
            subtitle:
                "Yuk segera booking restoran premium favoritmu sekarang juga..",
            isRead: true,
            trailing: "10.34",
          ),
          MessageCard(
            image: 'assets/message_picture/3.png',
            title: "Robert Fox",
            subtitle:
                "Yuk segera booking restoran premium favoritmu sekarang juga..",
            isRead: false,
            trailing: "10.34",
          ),
          MessageCard(
            image: 'assets/message_picture/3.png',
            title: "Robert Fox",
            subtitle:
                "Yuk segera booking restoran premium favoritmu sekarang juga..",
            isRead: false,
            trailing: "10.34",
          ),
          MessageCard(
            image: 'assets/message_picture/4.png',
            title: "Kristin Watson",
            subtitle:
                "Yuk segera booking restoran premium favoritmu sekarang juga..",
            isRead: false,
            trailing: "Monday",
          ),
          MessageCard(
            image: 'assets/message_picture/5.png',
            title: "Courtney Henry",
            subtitle:
                "Yuk segera booking restoran premium favoritmu sekarang juga..",
            isRead: false,
            trailing: "Tuesday",
          ),
          MessageCard(
            trailing: "Monday",
            image: 'assets/message_picture/7.png',
            title: "Jenny Wilson",
            subtitle:
                "Yuk segera booking restoran premium favoritmu sekarang juga..",
            isRead: false,
          )
        ],
      ),
    );
  }
}
