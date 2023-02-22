// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/controllers/restaurant_controller.dart';
import 'package:bonbon_new/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantHeader extends StatelessWidget {
  const RestaurantHeader({Key? key, required this.restaurantController})
      : super(key: key);
  final RestaurantController restaurantController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => ListTile(
            leading: Image.asset('assets/outlets/banana.png'),
            title: Text(
              "${restaurantController.meIncludeItemModels.value?.outlet?.name}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: ('SanFransisco'),
              ),
            ),
            subtitle: Text(
              "${restaurantController.meIncludeItemModels.value?.members?[0].id}",
              style: TextStyle(fontFamily: BaseTheme.font_family_sf),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.yellow,
                ),
                Text(
                  "4.3",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: ('SanFransisco'),
                  ),
                ),
                Text("(102)"),
                SizedBox(
                  width: 55,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
              height: 24,
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xFF94FBC9),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.alarm,
                    size: 15,
                    color: Color(0xFF028A49),
                  ),
                  Text(
                    "10.00 - 22.00",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: ('SanFransisco'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
              height: 24,
              width: 60,
              decoration: BoxDecoration(
                color: Color(0xFF94FBC9),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    size: 15,
                    color: Color(0xFF028A49),
                  ),
                  Text(
                    "120m",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: BaseTheme.font_family_sf,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.percent,
                  size: 17,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Promo code SPLITEAS40",
                style: TextStyle(
                  fontFamily: ('SanFransisco'),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.percent,
                  size: 17,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Promo menu daily deals disc. 40%",
                style: TextStyle(
                  fontFamily: ('SanFransisco'),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.percent,
                      size: 17,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Lihat semua promo",
                    style: TextStyle(
                      fontFamily: ('SanFransisco'),
                    ),
                  ),
                ],
              ),
              Icon(Icons.chevron_right)
            ],
          ),
        ),
        // ListTile(
        //   leading: Container(
        //     width: 24,
        //     height: 24,
        //     decoration: BoxDecoration(
        //         color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
        //     child: Icon(
        //       Icons.discount_outlined,
        //       size: 20,
        //     ),
        //   ),
        //   title: Text("Promo code SPLITEAS40"),
        // ),
      ],
    );
  }
}
