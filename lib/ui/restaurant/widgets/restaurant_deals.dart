// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:bonbon_new/ui/restaurant/widgets/restauran_deals_card.dart';
import 'package:flutter/material.dart';

class RestaurantDeals extends StatelessWidget {
  const RestaurantDeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Daily Deals 40%",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: ('SanFransisco'),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        GridView(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.8),
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          // padding: const EdgeInsets.all(20),
          children: [
            RestaurantDealsCard(
                image: 'assets/outlets/deals1.png',
                menu: 'Banana and Mandarin Buns',
                price: "Rp.50.000",
                rating: '4,3'),
            RestaurantDealsCard(
                image: 'assets/outlets/deals2.png',
                menu: 'Sweet Potato Breakfast Hash with dates and strawberry',
                price: "Rp.50.000",
                rating: '4,3'),
            RestaurantDealsCard(
                image: 'assets/outlets/deals1.png',
                menu: 'Banana and Mandarin Buns',
                price: "Rp.50.000",
                rating: '4,3'),
            RestaurantDealsCard(
                image: 'assets/outlets/deals2.png',
                menu: 'Banana and Mandarin Buns',
                price: "Rp.50.000",
                rating: '4,3'),
          ],
        )
      ],
    );
  }
}
