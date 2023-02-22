// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class RestaurantDealsCard extends StatelessWidget {
  const RestaurantDealsCard(
      {Key? key,
      required this.image,
      required this.menu,
      required this.price,
      required this.rating})
      : super(key: key);
  final String image;
  final String menu;
  final String price;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      menu,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: ('SanFransisco'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      price,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: ('SanFransisco'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        LineIcons.starAlt,
                        color: Colors.yellow,
                      ),
                      Text(
                        rating,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: ('SanFransisco'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
