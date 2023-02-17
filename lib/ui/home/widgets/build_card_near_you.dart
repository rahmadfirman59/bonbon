// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BuildCardNearYou extends StatelessWidget {
  const BuildCardNearYou(
      {Key? key,
      required this.image,
      required this.restaurant,
      required this.price,
      required this.rating,
      required this.location})
      : super(key: key);
  final String image;
  final String restaurant;
  final String price;
  final String rating;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 207,
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 70,
              width: 120,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      restaurant,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: ('SanFransisco'),
                      ),
                    ),
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
                  Padding(
                    padding: EdgeInsets.only(top: 1.5),
                    child: Row(
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 10),
              child: Text(
                location,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: ('SanFransisco'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
