// ignore_for_file: prefer_const_constructors

import 'package:bonbon_new/controllers/in_session_controller.dart';
import 'package:bonbon_new/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SessionCategories extends StatelessWidget {
  const SessionCategories(
      {Key? key,
      required this.inSessionController,
      required this.itemScrollController,
      required this.itemPositionsListener})
      : super(key: key);
  final InSessionController inSessionController;
  final ItemScrollController itemScrollController;
  final ItemPositionsListener itemPositionsListener;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                inSessionController.listView.toggle();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
                height: 32.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Color(0xFF5A8EE0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    inSessionController.listView.value == true
                        ? Icon(
                            color: BaseTheme.color_blue_1,
                            Icons.list,
                            size: 16,
                          )
                        : Icon(
                            color: BaseTheme.color_blue_1,
                            Icons.grid_view,
                            size: 16,
                          ),
                    SizedBox(
                      width: 4.w,
                    ),
                    inSessionController.listView.value == true
                        ? Text(
                            "List View",
                            style: TextStyle(
                              color: BaseTheme.color_blue_1,
                              fontFamily: BaseTheme.font_family_sf,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : Text(
                            "Grid View ",
                            style: TextStyle(
                              color: BaseTheme.color_blue_1,
                              fontFamily: BaseTheme.font_family_sf,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    inSessionController.menuLiteModels.value.categories?.length,
                itemBuilder: (BuildContext context, int index) {
                  var listItem = inSessionController
                      .menuLiteModels.value.categories?[index];
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          itemScrollController.scrollTo(
                              index: index,
                              duration: Duration(seconds: 2),
                              curve: Curves.easeInOutCubic);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Color(0xFF5A8EE0),
                            ),
                          ),
                          child: Text(
                            listItem?.master?.name ?? "",
                            style: TextStyle(
                              color: BaseTheme.color_blue_1,
                              fontFamily: BaseTheme.font_family_sf,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
