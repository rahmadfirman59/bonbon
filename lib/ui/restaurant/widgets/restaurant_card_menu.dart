// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/theme.dart';
import 'package:flutter/material.dart';

class RestaurantCardMenu extends StatelessWidget {
  const RestaurantCardMenu(
      {Key? key,
      required this.name,
      required this.image,
      required this.price,
      required this.rating})
      : super(key: key);
  final String name;
  final String image;
  final String price;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(image),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontFamily: BaseTheme.font_family_sf,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            price,
            style: TextStyle(
              fontSize: 12,
              fontFamily: BaseTheme.font_family_sf,
            ),
          ),
          // Row(
          //   children: [
          //     Icon(
          //       Icons.star,
          //       color: Colors.yellow,
          //       size: 20,
          //     ),
          //     Text(
          //       rating,
          //       style: TextStyle(
          //         fontSize: 12,
          //         fontFamily: BaseTheme.font_family_sf,
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
