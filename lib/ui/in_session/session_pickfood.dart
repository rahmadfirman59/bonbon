// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/controllers/session_pickfood_controller.dart';
import 'package:bonbon_new/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';

class SessionPickFood extends StatefulWidget {
  const SessionPickFood({
    Key? key,
  }) : super(key: key);

  @override
  State<SessionPickFood> createState() => _SessionPickFoodState();
}

class _SessionPickFoodState extends State<SessionPickFood> {
  @override
  Widget build(BuildContext context) {
    final sessionPickFoodcontroller = Get.put(SessionPickFoodController());

    sessionPickFoodcontroller.count.value = 1;
    var item = Get.arguments[0];
    sessionPickFoodcontroller.sessionMember = Get.arguments[1];
    // sessionPickFoodcontroller.sessionMember
    List sessionMember = Get.arguments[1];

    // bool _value = false;
    final myAppBar = AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.dangerous_outlined,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
    );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 120.h + MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("${Get.arguments[0].images[0].original}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            appBar: myAppBar,
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                SizedBox(
                  height: 122.h - MediaQuery.of(context).padding.top,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "${item.fullName}",
                    style: TextStyle(
                        fontFamily: BaseTheme.font_family_sf,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "${GlobalHelper.currency} ${GlobalHelper.formatNumber(item.price.toString())}",
                    style: TextStyle(
                        fontFamily: BaseTheme.font_family_sf,
                        fontSize: 16.sp,
                        color: BaseTheme.color_grey_8,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                // Text(sessionPickFoodcontroller.sessionMember.toString()),
                item.modifiers.length > 1
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          "Choose Variant",
                          style: TextStyle(
                              fontFamily: BaseTheme.font_family_open,
                              fontSize: 12.sp,
                              color: BaseTheme.color_grey_9,
                              fontWeight: FontWeight.w800),
                        ),
                      )
                    : SizedBox.shrink(),
                item.modifiers.length > 1
                    ? SizedBox(
                        height: 10.h,
                      )
                    : SizedBox.shrink(),
                item.modifiers.length > 1
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Container(
                          height: 48.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: item.modifiers.length,
                              itemBuilder: (BuildContext context, int index) {
                                var listItem = item.modifiers[index];
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: InkWell(
                                    onTap: () {
                                      sessionPickFoodcontroller
                                          .addOrRemoveModifiers(
                                              listItem.master.id);
                                    },
                                    child: Obx(() => Container(
                                          width: 104.w,
                                          height: 48.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: sessionPickFoodcontroller
                                                        .checkModifiers(listItem
                                                            .master.id) ==
                                                    false
                                                ? BaseTheme.color_soft_4
                                                : Colors.white,
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Text(
                                                listItem.master.name,
                                                style: TextStyle(
                                                    color: sessionPickFoodcontroller
                                                                .checkModifiers(
                                                                    listItem
                                                                        .master
                                                                        .id) ==
                                                            true
                                                        ? BaseTheme.color_blue_1
                                                        : BaseTheme
                                                            .color_dark_1,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Text("+ ${listItem.master.price}",
                                                  style: TextStyle(
                                                      color: sessionPickFoodcontroller
                                                                  .checkModifiers(
                                                                      listItem
                                                                          .master
                                                                          .id) ==
                                                              true
                                                          ? BaseTheme
                                                              .color_blue_1
                                                          : BaseTheme
                                                              .color_dark_1,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w800)),
                                            ],
                                          ),
                                        )),
                                  ),
                                );
                              }),
                        ),
                      )
                    : SizedBox.shrink(),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "Whose Order",
                    style: TextStyle(color: BaseTheme.color_grey_7),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Obx(
                      () => RadioGroup<String>.builder(
                        horizontalAlignment: MainAxisAlignment.start,
                        direction: Axis.horizontal,
                        groupValue:
                            sessionPickFoodcontroller.statusSet.toString(),
                        onChanged: (value) => {
                          sessionPickFoodcontroller.statusSet.value =
                              value ?? ""
                        },
                        items: sessionPickFoodcontroller.status,
                        itemBuilder: (item) => RadioButtonBuilder(
                          item,
                          textPosition: RadioButtonTextPosition.right,
                        ),
                        textStyle: TextStyle(
                            color: BaseTheme.color_grey_8,
                            fontFamily: BaseTheme.font_family_sf,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Obx(
                  (() => sessionPickFoodcontroller.statusSet.value ==
                          "Shared With"
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.w, vertical: 10),
                            decoration:
                                BoxDecoration(color: BaseTheme.bg_color),
                            height: 120.h,
                            width: 329.w,
                            child: ListView.builder(
                              itemCount:
                                  sessionPickFoodcontroller.menuElement.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTileTheme(
                                  contentPadding: EdgeInsets.all(0),
                                  dense: true,
                                  horizontalTitleGap: 2,
                                  child: CheckboxListTile(
                                    visualDensity: VisualDensity.compact,
                                    checkboxShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text(
                                      "${sessionPickFoodcontroller.menuElement[index]['nama']}",
                                      style: TextStyle(
                                          fontFamily: BaseTheme.font_family_sf,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp),
                                    ),
                                    value: sessionPickFoodcontroller
                                        .isChecked[index],
                                    onChanged: (value) {
                                      print(value);
                                      sessionPickFoodcontroller
                                          .addOrRemoveMember(
                                              sessionPickFoodcontroller
                                                  .menuElement[index]["id"]);
                                      // sessionPickFoodcontroller
                                      //     .checkedMember[index] = value;
                                      setState(
                                        () {
                                          sessionPickFoodcontroller
                                              .isChecked[index] = value!;
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : SizedBox.shrink()),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    width: 328.w,
                    height: 56.h,
                    child: TextField(
                      controller: sessionPickFoodcontroller.notesController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Colors.grey, width: 0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Colors.grey, width: 0),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Notes (optional)",
                        hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: BaseTheme.color_grey_7,
                            fontFamily: BaseTheme.font_family_sf,
                            fontWeight: FontWeight.w400),
                      ),
                      onChanged: (tableCode) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    InkWell(
                      onTap: () {
                        sessionPickFoodcontroller.decrement();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF40B7EA),
                            borderRadius: BorderRadius.circular(10)),
                        width: 32,
                        height: 32,
                        child: Icon(Icons.remove),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Obx(
                      () => Text(
                        sessionPickFoodcontroller.count.value.toString(),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                      onTap: () {
                        sessionPickFoodcontroller.increment();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF40B7EA),
                            borderRadius: BorderRadius.circular(10)),
                        width: 32,
                        height: 32,
                        child: Icon(Icons.add),
                      ),
                    ),
                    SizedBox(
                      width: 47.w,
                    ),
                    SizedBox(
                      width: 160.w, // <-- match_parent
                      height: 48, // <-- match-parent
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF00CC36),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            padding: EdgeInsets.all(
                                15) //content padding inside button
                            ),
                        onPressed: () {
                          print(sessionPickFoodcontroller.statusSet);
                          sessionPickFoodcontroller.addToCart(
                            sessionPickFoodcontroller.statusSet,
                            sessionMember,
                            item.id,
                            sessionPickFoodcontroller.notesController.text
                                .trim(),
                            sessionPickFoodcontroller.count.value,
                          );

                          sessionPickFoodcontroller.notesController.clear();
                          // inSessionController.addToCart(member, menuId, inSessionController.count.value)
                        },
                        child: Text("Add to Basket",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: BaseTheme.font_family_sf,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
