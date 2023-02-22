// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/controllers/restaurant_controller.dart';

import 'package:bonbon_new/ui/restaurant/widgets/restaurant_card_review.dart';
import 'package:bonbon_new/ui/restaurant/widgets/restaurant_categories.dart';
import 'package:bonbon_new/ui/restaurant/widgets/restaurant_combo_packages.dart';
import 'package:bonbon_new/ui/restaurant/widgets/restaurant_deals.dart';
import 'package:bonbon_new/ui/restaurant/widgets/restaurant_header.dart';
import 'package:bonbon_new/ui/restaurant/widgets/restaurant_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Restaurant extends StatelessWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.put(RestaurantController());
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/outlets/outlet.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            body: ListView(
              // shrinkWrap: true,
              children: [
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    height: 260,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: RestaurantHeader(
                      restaurantController: restaurantController,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RestauranCardReview(),
                SizedBox(
                  height: 20,
                ),
                RestaurantComboPackages(),
                SizedBox(
                  height: 20,
                ),
                RestaurantDeals(),
                SizedBox(
                  height: 20,
                ),
                RestaurantCategories(
                  restaurantController: restaurantController,
                ),
                SizedBox(
                  height: 20,
                ),
                RestaurantMenu(
                  restaurantController: restaurantController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
