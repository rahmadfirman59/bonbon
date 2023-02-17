// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/ui/home/widgets/build_card_categories.dart';
import 'package:bonbon_new/ui/home/widgets/build_card_menu.dart';
import 'package:flutter/material.dart';

class BuildCategories extends StatelessWidget {
  const BuildCategories({Key? key}) : super(key: key);

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
                Text("Categories",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ],
            ),
          ),
          SizedBox(
            height: 80,
            child:
                // ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   shrinkWrap: true,
                //   itemCount: 4,
                //   itemBuilder: (BuildContext context, int index) {
                //     return Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: Colors.white,
                //         ),
                //         width: 80,
                //         height: 80,
                //         child: Center(
                //           child: Text("Asian"),
                //         ),
                //       ),
                //     );
                //   },
                // ),
                ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                BuildCardCategories(image: 'assets/categories/1.png'),
                BuildCardCategories(image: 'assets/categories/2.png'),
                BuildCardCategories(image: 'assets/categories/3.png'),
                BuildCardCategories(image: 'assets/categories/4.png'),
                BuildCardCategories(image: 'assets/categories/5.png'),
                BuildCardCategories(image: 'assets/categories/6.png'),
                BuildCardCategories(image: 'assets/categories/7.png'),
                BuildCardCategories(image: 'assets/categories/8.png'),
                BuildCardCategories(image: 'assets/categories/9.png'),
                BuildCardCategories(image: 'assets/categories/10.png'),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              BuildCardMenu(
                image: 'assets/restaurant/image.png',
                restaurant: 'LongHorn Steakhouse',
                rating: "5.9",
                location: "Jakarta Selatan",
              ),
              BuildCardMenu(
                image: 'assets/menu/menu1.png',
                restaurant: 'Islands Fine Burgers & Drinks',
                rating: "5.9",
                location: "Jakarta Selatan",
              ),
              BuildCardMenu(
                image: 'assets/menu/menu2.png',
                restaurant: 'Islands Fine Burgers & Drinks',
                rating: "5.9",
                location: "Jakarta Selatan",
              ),
              BuildCardMenu(
                image: 'assets/menu/menu3.png',
                restaurant: 'Islands Fine Burgers & Drinks',
                rating: "5.9",
                location: "Jakarta Selatan",
              ),
            ],
          )
        ],
      ),
    );
  }
}
