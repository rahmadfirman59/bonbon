// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:bonbon_new/controllers/index_controller.dart';
import 'package:bonbon_new/routes/routes_name.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/home/home.dart';
import 'package:bonbon_new/ui/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  IndexController indexController = Get.put(IndexController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: indexController.currentIndex.value,
            children: [
              Home(),
              Container(),
              Container(),
              Profile(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) async {
            switch (index) {
              case 0:
                print('home');
                break;
              case 1:
                Get.toNamed(RouteName.scan);
                break;
              case 2:
                Get.toNamed(RouteName.inbox);
                print('inbox');
                break;
              case 3:
                print('profile');
                break;
            }
            indexController.currentIndex.value = index;
          },
          currentIndex: indexController.currentIndex.value,
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
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_filled),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(CupertinoIcons.qrcode_viewfinder),
              activeIcon: Icon(CupertinoIcons.qrcode_viewfinder),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.inbox),
              activeIcon: Icon(Icons.inbox_rounded),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(CupertinoIcons.person),
              activeIcon: Icon(CupertinoIcons.person_alt_circle),
            ),
          ],
        ),
      ),
    );
  }
}
