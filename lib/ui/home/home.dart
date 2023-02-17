// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:bonbon_new/controllers/home_controller.dart';
import 'package:bonbon_new/ui/home/widgets/build_categories.dart';
import 'package:bonbon_new/ui/home/widgets/build_header.dart';
import 'package:bonbon_new/ui/home/widgets/build_near_you.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/build_popular.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: ListView(
          children: [
            BuildHeaderHome(controller: controller),
            BuildNearYou(
              homeController: controller,
              nearbyList: controller.popularRestaurantModel.value.data ?? [],
            ),
            BuildPopular(
              homeController: controller,
              myList: controller.popularRestaurantModel.value.data ?? [],
            ),
            BuildCategories()
          ],
        ),
      ),
    );
  }
}
