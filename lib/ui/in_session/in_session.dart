// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/controllers/in_session_controller.dart';
import 'package:bonbon_new/routes/routes_name.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/in_session/widgets/session_categories.dart';
import 'package:bonbon_new/ui/in_session/widgets/session_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InSession extends StatelessWidget {
  const InSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inSessionController = Get.put(InSessionController());
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    final myAppBar = AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          // Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      title: Obx(() => Text(
            "${inSessionController.sessionSummaryModel.value?.outlet?.name}",
            style: TextStyle(
                fontFamily: BaseTheme.font_family_open,
                fontSize: 16.sp,
                fontWeight: FontWeight.w800),
          )),
      actions: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.shopping_bag,
            color: Colors.white,
          ),
        )
      ],
    );
    // final bodyHeight = mediaQueryHeight -
    //     myAppBar.preferredSize.height -
    //     MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 120.h + MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/outlets/outlet.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: myAppBar,
            body: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 122.h - MediaQuery.of(context).padding.top,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text(
                              "Table ${inSessionController.sessionSummaryModel.value?.table?.name}",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: BaseTheme.font_family_open,
                                  fontWeight: FontWeight.w800),
                            )),
                        Obx(() => Text(
                              "${inSessionController.sessionSummaryModel.value?.members?.length}/${inSessionController.sessionSummaryModel.value?.table?.pax} Pax",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: BaseTheme.font_family_open,
                                  fontWeight: FontWeight.w800),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${inSessionController.sessionSummaryModel.value?.members?[0].user?.name}",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: BaseTheme.font_family_sf,
                              fontWeight: FontWeight.w400),
                        ),
                        Obx(
                          () => Text(
                            "Start ${GlobalHelper.timeFormat.format(inSessionController.sessionSummaryModel.value?.createdAt ?? DateTime.now())}",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: BaseTheme.font_family_sf,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SessionCategories(inSessionController: inSessionController),
                  SizedBox(
                    height: 16,
                  ),
                  SessionMenu(inSessionController: inSessionController)
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) async {
                switch (index) {
                  case 0:
                    Get.toNamed(RouteName.session_share_qr);
                    break;
                  case 1:
                    print("2");
                    break;
                  case 2:
                    // Get.toNamed(RouteName.inbox);
                    print('3');
                    break;
                  case 3:
                    print('4');
                    break;
                }
                // indexController.currentIndex.value = index;
              },
              elevation: 1,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: BaseTheme.color_grey_8,
              unselectedItemColor: BaseTheme.color_grey_8,
              items: const [
                BottomNavigationBarItem(
                  label: "Share QR",
                  icon: Icon(Icons.share),
                ),
                BottomNavigationBarItem(
                  label: "TableMate",
                  icon: Icon(Icons.people),
                ),
                BottomNavigationBarItem(
                  label: "Call Waiter",
                  icon: Icon(Icons.notifications),
                ),
                BottomNavigationBarItem(
                  label: "Order Status",
                  icon: Icon(Icons.layers),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
