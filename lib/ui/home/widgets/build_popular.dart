// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_is_empty

import 'package:bonbon_new/controllers/home_controller.dart';
import 'package:bonbon_new/models/popular_restaurant_model.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/home/widgets/build_card_popular.dart';
import 'package:flutter/material.dart';

class BuildPopular extends StatelessWidget {
  const BuildPopular(
      {Key? key, required this.homeController, required this.myList})
      : super(key: key);
  final HomeController homeController;
  final List<Datum> myList;

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
                Text("Popular Restaurant",
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
          SizedBox(
            height: 207,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: myList.length,
              itemBuilder: (BuildContext context, int index) {
                return myList[index].images?.length != 0
                    ? BuildCardPopular(
                        image: myList[index].images?[0].thumb ?? "",
                        restaurant: "${myList[index].name}",
                        rating: '4.9',
                        location: 'Jakarta Selatan',
                      )
                    : BuildCardPopular(
                        image: 'assets/restaurant/image2.jpg',
                        restaurant: "${myList[index].name}",
                        rating: '4.9',
                        location: 'Jakarta Selatan',
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
