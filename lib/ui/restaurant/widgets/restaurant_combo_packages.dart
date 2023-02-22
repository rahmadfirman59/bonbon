// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/ui/restaurant/widgets/restaurant_combo_card.dart';
import 'package:flutter/material.dart';

class RestaurantComboPackages extends StatelessWidget {
  const RestaurantComboPackages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Combo Packages",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: ('SanFransisco'),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return RestaurantComboCard();
            },
          ),
        ),
      ],
    );
  }
}
