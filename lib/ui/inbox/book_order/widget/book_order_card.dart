// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/theme.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

class BookOrderCard extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? subtitle;
  final bool? isRead;
  const BookOrderCard(
      {Key? key, this.icon, this.title, this.subtitle, this.isRead})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isRead == false
          ? BoxDecoration(color: Colors.white)
          : BoxDecoration(color: Color(0xFFC7FFE4)),
      child: Flexible(
        child: Column(
          children: [
            ListTile(
              leading: isRead == true
                  ? Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.yellow,
                      ),
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    )
                  : Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFFBFBFBF),
                      ),
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    ),
              title: Text(
                title ?? "",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: BaseTheme.color_grey_8,
                  fontFamily: BaseTheme.font_family_sf,
                ),
              ),
              subtitle: Text(
                subtitle ?? "",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: BaseTheme.color_grey_7,
                  fontFamily: BaseTheme.font_family_sf,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: BaseTheme.color_grey_8,
              ),
            ),
            ExpandableNotifier(
              // <-- Provides ExpandableController to its children
              child: Column(
                children: [
                  Expandable(
                    // <-- Driven by ExpandableController from ExpandableNotifier
                    collapsed: ExpandableButton(
                      // <-- Expands when tapped on the cover photo
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 75, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 89,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Details",
                                    style: TextStyle(
                                      color: BaseTheme.color_grey_2,
                                      fontSize: 12,
                                      fontFamily: BaseTheme.font_family_sf,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    expanded: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 75, vertical: 5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    LineIcons.user,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "5 Person",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: ('SanFransisco'),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    LineIcons.table,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Front-048",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: ('SanFransisco'),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.file_copy,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Birtay Party",
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
                        ExpandableButton(
                          // <-- Expands when tapped on the cover photo
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 75, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  width: 100,
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hide",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                          fontFamily: ('SanFransisco'),
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_up,
                                        color: Colors.blue,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    // return ExpandableNotifier(
    //   // <-- Provides ExpandableController to its children
    //   child: Column(
    //     children: [
    //       Expandable(
    //         // <-- Driven by ExpandableController from ExpandableNotifier
    //         collapsed: ExpandableButton(
    //           // <-- Expands when tapped on the cover photo
    //           child: Icon(icon),
    //         ),
    //         expanded: Column(children: [
    //           // buildAllPhotos(),
    //           ExpandableButton(
    //             // <-- Collapses when tapped on
    //             child: ,
    //           ),
    //         ]),
    //       ),
    //     ],
    //   ),
    // );
  }
}
