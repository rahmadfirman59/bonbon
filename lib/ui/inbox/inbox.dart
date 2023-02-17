// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/controllers/inbox_controller.dart';

import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/inbox/book_order/book_order.dart';
import 'package:bonbon_new/ui/inbox/message/message.dart';
import 'package:bonbon_new/ui/inbox/notifications/notifications.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    InboxController inboxController = Get.put(InboxController());
    return Obx(() => Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: inboxController.currentIndex.value,
              children: [
                Notifications(),
                Message(),
                BookOrder(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) async {
              switch (index) {
                case 0:
                  break;
                case 1:
                  break;
                case 2:
                  break;
              }
              inboxController.currentIndex.value = index;
            },
            currentIndex: inboxController.currentIndex.value,
            elevation: 1,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: BaseTheme.main_color,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: BaseTheme.color_grey_8,
            items: const [
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.notifications),
                activeIcon: Icon(Icons.notifications),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.inbox),
                activeIcon: Icon(Icons.inbox),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(LineIcons.book),
                activeIcon: Icon(LineIcons.book),
              ),
            ],
          ),
        ));
  }
}
