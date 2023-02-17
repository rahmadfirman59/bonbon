// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';

class BuildCardPopular extends StatelessWidget {
  const BuildCardPopular(
      {Key? key,
      required this.image,
      required this.restaurant,
      required this.rating,
      required this.location})
      : super(key: key);
  final String image;
  final String restaurant;
  final String rating;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {
          // Get.toNamed(Routes.RESTAURANT);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: 207,
          width: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image.asset(
              //   image,
              //   fit: BoxFit.fill,
              // ),
              Container(
                height: 130,
                width: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //set border radius to 50% of square height and width
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover, //change image fill type
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 38,
                width: 240,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        restaurant,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
