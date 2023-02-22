// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RestauranCardReview extends StatelessWidget {
  const RestauranCardReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white),
        child: ListTile(
          leading: Icon(
            Icons.star,
            color: Colors.yellow,
            size: 20,
          ),
          title: Text(
            "4.3 from 102 reviews",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: ('SanFransisco'),
            ),
          ),
          trailing: Icon(Icons.chevron_right_outlined),
        ),
      ),
    );
  }
}
