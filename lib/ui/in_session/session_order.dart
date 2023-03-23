// ignore_for_file: prefer_const_constructors

import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/controllers/session_order_controller.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/component/primray_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SessionOrder extends StatefulWidget {
  const SessionOrder({Key? key}) : super(key: key);

  @override
  State<SessionOrder> createState() => _SessionOrderState();
}

class _SessionOrderState extends State<SessionOrder> {
  SessionOrderController sessionOrderController =
      Get.put(SessionOrderController());
  UniqueKey? keyTile;
  bool isExpanded = false;
  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    isExpanded = false;
    keyTile = UniqueKey();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "Order Status",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: BaseTheme.font_family_open),
            ),
          ),
          body: Obx(
            () => ListView.builder(
              itemCount: sessionOrderController.ordertype.length,
              itemBuilder: (BuildContext context, int index) {
                var order = sessionOrderController
                    .orderInludeItemModels.value.orders!
                    .where((element) {
                  return element.type ==
                      sessionOrderController.ordertype[index];
                }).toList();
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          sessionOrderController.orderTitletype[index],
                          style: TextStyle(
                            fontFamily: BaseTheme.font_family_open,
                            fontWeight: FontWeight.w800,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      for (var items in order)
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${items.name}",
                                style: TextStyle(
                                  fontFamily: BaseTheme.font_family_sf,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${GlobalHelper.currency} ${GlobalHelper.formatNumber(items.total.toString())}",
                                style: TextStyle(
                                  fontFamily: BaseTheme.font_family_sf,
                                  fontWeight: FontWeight.w400,
                                  color: BaseTheme.color_grey_7,
                                  fontSize: 12.sp,
                                ),
                              ),
                              ExpansionTile(
                                key: keyTile,
                                onExpansionChanged: (isExpanded) {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                trailing: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    color: items.status == "pending"
                                        ? BaseTheme.color_grey_4
                                        : items.status == "processing"
                                            ? Color(0xFFFFE606)
                                            : items.status == "served"
                                                ? BaseTheme.primary_color
                                                : Colors.red,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  height: 22.h,
                                  child: Text(
                                    "${items.status}",
                                    style: TextStyle(
                                      fontFamily: BaseTheme.font_family_sf,
                                      fontWeight: FontWeight.w400,
                                      color: items.status == "pending" ||
                                              items.status == "processing"
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                                title: Container(
                                  height: 40,
                                  width: 100,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Details",
                                        style: TextStyle(
                                          fontFamily: BaseTheme.font_family_sf,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                      )
                                    ],
                                  ),
                                ),
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: BaseTheme.color_grey_2),
                                    height: 106.h,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.person),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            for (var person in items.members!)
                                              Text(
                                                "${person.name},",
                                                style: TextStyle(
                                                  fontFamily:
                                                      BaseTheme.font_family_sf,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.sp,
                                                ),
                                              )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.description),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Text(
                                              items.note ?? "",
                                              style: TextStyle(
                                                fontFamily:
                                                    BaseTheme.font_family_sf,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12.sp,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.description),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            for (var modif in items.modifiers!)
                                              Text(
                                                "$modif,",
                                                style: TextStyle(
                                                  fontFamily:
                                                      BaseTheme.font_family_sf,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.sp,
                                                ),
                                              )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      Divider(
                        height: 4,
                        color: BaseTheme.color_grey_4,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: BaseTheme.color_grey_2,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal"),
                      Obx(
                        () => Text(
                          "${GlobalHelper.currency} ${GlobalHelper.formatNumber(sessionOrderController.orderInludeItemModels.value.netTotal.toString())}",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: PrimaryButton(
                  text: "Pay Now",
                  isValid: true,
                  onPressed: () {
                    // cartController.order();
                  },
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
