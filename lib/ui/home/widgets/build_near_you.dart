// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bonbon_new/controllers/home_controller.dart';
import 'package:bonbon_new/models/popular_restaurant_model.dart' as nearby;
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/home/widgets/build_card_near_you.dart';
import 'package:flutter/material.dart';

class BuildNearYou extends StatelessWidget {
  const BuildNearYou(
      {Key? key, required this.homeController, required this.nearbyList})
      : super(key: key);

  final HomeController homeController;

  final List<nearby.Datum> nearbyList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Near You",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text(
                  "Lihat Semua",
                  style: TextStyle(
                      color: BaseTheme.main_color,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 220,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     shrinkWrap: true,
          //     children: [
          //       BuildCardNearYou(
          //           image: 'assets/food/food-1.png',
          //           restaurant: 'Banana and Mandarin Buns',
          //           price: 'Rp 50.000',
          //           rating: '4.9',
          //           location: 'Jakarta Selatan'),
          //       BuildCardNearYou(
          //           image: 'assets/food/food-2.png',
          //           restaurant: 'Banana and Mandarin Buns',
          //           price: 'Rp 50.000',
          //           rating: '4.9',
          //           location: 'Jakarta Selatan'),
          //       BuildCardNearYou(
          //           image: 'assets/food/food-3.jpeg',
          //           restaurant: 'Baskin Robbins',
          //           price: 'Rp 50.000',
          //           rating: '4.3',
          //           location: 'Jakarta Selatan'),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              itemCount: nearbyList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                var listItem = nearbyList[index];
                return BuildCardNearYou(
                    image: 'assets/food/food-3.jpeg',
                    restaurant: listItem.name ?? '',
                    price: 'Rp 50.000',
                    rating: '4.3',
                    location: 'Jakarta Selatan');
              },
            ),
          ),
        ],
      ),
    );
  }
}
