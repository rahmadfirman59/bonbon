// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/controllers/profile_controller.dart';
import 'package:bonbon_new/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(Profilecontroller());
    return SafeArea(
      child: ListView(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/profile/background.png'),
                  ),
                ),
                height: 173,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.share),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 17, right: 11),
                          child: Container(
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/profile/oval.png'),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${profileController.meModel.value?.name}",
                              style: TextStyle(
                                  fontFamily: BaseTheme.font_family_open),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 71,
                              height: 20,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF8E8E8E),
                                      Color(0xFF444444),

                                      //add more colors for gradient
                                    ],
                                    begin: Alignment
                                        .topLeft, //begin of the gradient color
                                    end: Alignment
                                        .bottomRight, //end of the gradient color
                                    stops: [
                                      0,
                                      0.2,
                                    ] //stops for individual color
                                    //set the stops number equal to numbers of color
                                    ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: Text(
                                  "Platinum",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text("2 Friends"),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 3,
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("16 Restaurants"),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 62,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(20, 146, 20, 35),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), //color of shadow
                      spreadRadius: 1, //spread radius
                      blurRadius: 2, // blur radius
                      offset: Offset(0, 2), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rp 13.400",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: BaseTheme.font_family_sf,
                          ),
                        ),
                        Text(
                          "Saldo",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: BaseTheme.font_family_sf,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 46,
                      color: Color(0xFFEEEEEE),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rp 13.400",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: BaseTheme.font_family_sf,
                          ),
                        ),
                        Text(
                          "Points",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: BaseTheme.font_family_sf,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: Icon(
                      LineIcons.user,
                      color: Colors.black,
                    ),
                    title: Text(
                      "My Profile",
                      style: TextStyle(
                        color: BaseTheme.color_grey_8,
                        fontWeight: FontWeight.w700,
                        fontFamily: BaseTheme.font_family_sf,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(LineIcons.comment),
                    title: Text(
                      "Reviews",
                      style: TextStyle(
                        color: BaseTheme.color_grey_8,
                        fontWeight: FontWeight.w700,
                        fontFamily: BaseTheme.font_family_sf,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(LineIcons.alternateShield),
                    title: Text(
                      "Security",
                      style: TextStyle(
                        color: BaseTheme.color_grey_8,
                        fontWeight: FontWeight.w700,
                        fontFamily: BaseTheme.font_family_sf,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(LineIcons.creditCard),
                    title: Text(
                      "Payment Method",
                      style: TextStyle(
                        color: BaseTheme.color_grey_8,
                        fontWeight: FontWeight.w700,
                        fontFamily: BaseTheme.font_family_sf,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(LineIcons.squareWave),
                    title: Text(
                      "Session History",
                      style: TextStyle(
                        color: BaseTheme.color_grey_8,
                        fontWeight: FontWeight.w700,
                        fontFamily: BaseTheme.font_family_sf,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(LineIcons.fileAlt),
                    title: Text(
                      "Complaints",
                      style: TextStyle(
                        color: BaseTheme.color_grey_8,
                        fontWeight: FontWeight.w700,
                        fontFamily: BaseTheme.font_family_sf,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(LineIcons.questionCircle),
                    title: Text(
                      "Help Center",
                      style: TextStyle(
                        color: BaseTheme.color_grey_8,
                        fontWeight: FontWeight.w700,
                        fontFamily: BaseTheme.font_family_sf,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
