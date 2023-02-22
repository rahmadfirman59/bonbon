// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';

class RestaurantComboCard extends StatelessWidget {
  const RestaurantComboCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: 100,
          width: 288,
          child: Row(
            children: [
              Image.asset(
                'assets/outlets/combo.png',
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      "Ice Banana + Orange Cakes",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: ('SanFransisco'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "Rp 150.000",
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: ('SanFransisco'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "Rp 50.000",
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
                          "4.3",
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
            ],
          )
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Image.asset(
          //       'assets/outlets/combo.png',
          //     ),
          //     Container(
          //       padding: EdgeInsets.symmetric(horizontal: 8),
          //       height: 70,
          //       width: 120,
          //       child: ListView(
          //         shrinkWrap: true,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(top: 4),
          //             child: Text(
          //               "Ice Banana + Orange Cakes",
          //               style: TextStyle(
          //                 overflow: TextOverflow.ellipsis,
          //                 fontSize: 12,
          //                 fontWeight: FontWeight.bold,
          //                 fontFamily: ('SanFransisco'),
          //               ),
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(top: 2),
          //             child: Text(
          //               "Rp 50.000",
          //               style: TextStyle(
          //                 fontSize: 12,
          //                 fontFamily: ('SanFransisco'),
          //               ),
          //             ),
          //           ),
          //           Padding(
          //             padding: EdgeInsets.only(top: 1.5),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               children: [
          //                 Icon(
          //                   LineIcons.starAlt,
          //                   color: Colors.yellow,
          //                 ),
          //                 Text(
          //                   "4.3",
          //                   style: TextStyle(
          //                     fontSize: 12,
          //                     fontFamily: ('SanFransisco'),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
