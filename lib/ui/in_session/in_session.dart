// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_is_empty, invalid_use_of_protected_member, sized_box_for_whitespace

import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/controllers/in_session_controller.dart';
import 'package:bonbon_new/routes/routes_name.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/in_session/widgets/session_categories.dart';
import 'package:bonbon_new/ui/in_session/widgets/session_menu.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shimmer/shimmer.dart';

class InSession extends StatelessWidget {
  const InSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inSessionController = Get.put(InSessionController());
    // final mediaQueryHeight = MediaQuery.of(context).size.height;
    final ItemScrollController itemScrollController = ItemScrollController();
    final ItemPositionsListener itemPositionsListener =
        ItemPositionsListener.create();

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
            "${inSessionController.sessionSummaryModel.value.outlet?.name}",
            style: TextStyle(
                fontFamily: BaseTheme.font_family_open,
                fontSize: 16.sp,
                fontWeight: FontWeight.w800),
          )),
      actions: [
        badges.Badge(
          showBadge: true,
          badgeContent:
              inSessionController.cartItemModels.value.items?.length != 0
                  ? Obx(
                      () => Text(
                        "${inSessionController.cartItemModels.value.items?.length}",
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  : Text("0"),
          position: badges.BadgePosition.topStart(top: 3, start: 3),
          badgeStyle: badges.BadgeStyle(
            badgeColor: Colors.white,
          ),
          child: IconButton(
            onPressed: () {
              Get.toNamed(RouteName.cart_item);
            },
            icon: Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
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
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: myAppBar,
            body: Column(
              children: [
                SizedBox(
                  height: 122.h - MediaQuery.of(context).padding.top,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          "Table ${inSessionController.sessionSummaryModel.value.table?.name}",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: BaseTheme.font_family_open,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${inSessionController.sessionSummaryModel.value.members?.length}/${inSessionController.sessionSummaryModel.value.pax} Pax",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: BaseTheme.font_family_open,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => inSessionController.leaderName.isNotEmpty
                            ? Text(
                                "${inSessionController.leaderName.value[0].user.name}",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: BaseTheme.font_family_sf,
                                    fontWeight: FontWeight.w400),
                              )
                            : Shimmer.fromColors(
                                baseColor: Colors.red,
                                highlightColor: Colors.yellow,
                                child: Text(
                                  'Leader',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: BaseTheme.font_family_sf,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                      ),
                      Obx(
                        () => Text(
                          "Start ${GlobalHelper.timeFormat.format(inSessionController.sessionSummaryModel.value.createdAt ?? DateTime.now())}",
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
                SessionCategories(
                  inSessionController: inSessionController,
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                ),
                SizedBox(
                  height: 16,
                ),
                SessionMenu(
                  inSessionController: inSessionController,
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) async {
                switch (index) {
                  case 0:
                    Get.toNamed(RouteName.session_share_qr, arguments: [
                      inSessionController.sessionSummaryModel.value.id
                    ]);
                    break;
                  case 1:
                    Get.bottomSheet(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 32.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              'Table Members',
                              style: TextStyle(
                                  color: BaseTheme.color_grey_8,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16.sp,
                                  fontFamily: BaseTheme.font_family_open),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Container(
                              height: 300,
                              child: ListView.builder(
                                itemCount: inSessionController
                                    .sessionSummaryModel.value.members?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var members = inSessionController
                                      .sessionSummaryModel
                                      .value
                                      .members?[index];
                                  return ListTile(
                                    leading: SizedBox(
                                      width: 30.w,
                                      height: 64.h,
                                      child: Lottie.network(
                                        'https://assets9.lottiefiles.com/packages/lf20_dggAm75MbY.json',
                                      ),
                                    ),
                                    title: members?.status == "active"
                                        ? Text(
                                            members?.user?.name ?? "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily:
                                                    BaseTheme.font_family_sf,
                                                fontSize: 14.sp,
                                                color: BaseTheme.color_grey_9),
                                          )
                                        : Text(members?.user?.name ?? "",
                                            style: TextStyle(
                                              color: BaseTheme.color_grey_5,
                                              fontWeight: FontWeight.w700,
                                              fontFamily:
                                                  BaseTheme.font_family_sf,
                                              fontSize: 14.sp,
                                            )),
                                    subtitle: members?.isLeader == true
                                        ? Text("Admin Table")
                                        : members?.status == "active"
                                            ? Text(
                                                "Start ${GlobalHelper.timeFormat.format(members?.createdAt ?? DateTime.now())}",
                                                style: TextStyle(
                                                    color:
                                                        BaseTheme.color_grey_7,
                                                    fontFamily: BaseTheme
                                                        .font_family_sf,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            : Text(
                                                "Waiting to approve.....",
                                                style: TextStyle(
                                                    color:
                                                        BaseTheme.color_grey_5,
                                                    fontFamily: BaseTheme
                                                        .font_family_sf,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                    trailing: members?.isLeader == false &&
                                            members?.status == "pending"
                                        ? Container(
                                            width: 100,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                // Icon(Icons.close),
                                                IconButton(
                                                  onPressed: () {
                                                    Get.defaultDialog(
                                                      title: "Member",
                                                      titleStyle: TextStyle(
                                                          fontFamily: BaseTheme
                                                              .font_family_sf,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14.sp),
                                                      content: Text(
                                                          "Are you sure want to decline ${members?.user?.name} ?"),
                                                      onConfirm: () {
                                                        inSessionController
                                                            .action(
                                                                members?.id,
                                                                members?.user
                                                                    ?.name,
                                                                "declined");
                                                        Get.back();
                                                      },
                                                      textConfirm: "Yes",
                                                      textCancel: "Cancel",
                                                      buttonColor:
                                                          BaseTheme.main_color,
                                                      confirmTextColor:
                                                          Colors.black,
                                                      onCancel: () {
                                                        Get.back();
                                                      },
                                                      radius: 10,
                                                    );

                                                    debugPrint("Action");
                                                  },
                                                  icon: Icon(Icons.close),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.defaultDialog(
                                                      title: "Member",
                                                      titleStyle: TextStyle(
                                                          fontFamily: BaseTheme
                                                              .font_family_sf,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14.sp),
                                                      content: Text(
                                                          "Are you sure to approve ${members?.user?.name} ?"),
                                                      onConfirm: () {
                                                        inSessionController
                                                            .action(
                                                                members?.id,
                                                                members?.user
                                                                    ?.name,
                                                                "approved");
                                                        Get.back();
                                                      },
                                                      textConfirm: "Yes",
                                                      textCancel: "Cancel",
                                                      buttonColor:
                                                          BaseTheme.main_color,
                                                      confirmTextColor:
                                                          Colors.black,
                                                      onCancel: () {
                                                        Get.back();
                                                      },
                                                      radius: 10,
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        color: BaseTheme
                                                            .primary_color),
                                                    height: 32,
                                                    width: 32,
                                                    child: Icon(Icons.check),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20)),
                      ),
                      enableDrag: false,
                    );

                    break;
                  case 2:
                    break;
                  case 3:
                    Get.toNamed(RouteName.session_order);
                }
                // indexController.currentIndex.value = index;
              },
              elevation: 1,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: BaseTheme.color_grey_8,
              unselectedItemColor: BaseTheme.color_grey_8,
              items: [
                BottomNavigationBarItem(
                  label: "Share QR",
                  icon: Icon(Icons.share),
                ),
                BottomNavigationBarItem(
                  label: "Table Mate",
                  icon: Obx(
                    () => inSessionController.requestJoin.value != 0
                        ? badges.Badge(
                            position:
                                badges.BadgePosition.topEnd(top: -10, end: -6),
                            badgeContent: Obx(
                              () => Text(
                                "${inSessionController.requestJoin.value}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: BaseTheme.font_family_sf),
                              ),
                            ),
                            child: Icon(Icons.people),
                          )
                        : Icon(Icons.people),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Call Waiter",
                  icon: Icon(Icons.notifications),
                ),
                BottomNavigationBarItem(
                  label: "Order Status",
                  icon: badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -10, end: -6),
                    badgeContent: Text(
                      "3",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          fontFamily: BaseTheme.font_family_sf),
                    ),
                    child: Icon(Icons.layers),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
