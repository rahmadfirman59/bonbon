// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'package:bonbon_new/controllers/in_session_controller.dart';
import 'package:bonbon_new/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';

class SessionPickFood extends StatelessWidget {
  const SessionPickFood({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InSessionController inSessionController = Get.find();
    inSessionController.count.value = 1;
    var item = Get.arguments[0];
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
                    "Rp ${item.price}",
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
                                  child: Container(
                                    width: 104.w,
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1, color: Colors.blue),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          listItem.master.name,
                                          style: TextStyle(
                                              color: BaseTheme.color_blue_1,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Text("+ ${listItem.master.price}",
                                            style: TextStyle(
                                                color: BaseTheme.color_blue_1,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w800)),
                                      ],
                                    ),
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
                        groupValue: inSessionController.statusSet.toString(),
                        onChanged: (value) =>
                            {inSessionController.statusSet.value = value ?? ""},
                        items: inSessionController.status,
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: [
                //         Radio(
                //           value: inSessionController.statusSet,
                //           groupValue: inSessionController.status,
                //           onChanged: (val) {
                //             // setState(() {
                //             //   radioButtonItem = 'ONE';
                //             //   id = 1;
                //             // });
                //           },
                //         ),
                //         Text('Only Me',
                //             style: TextStyle(
                //               fontSize: 16.sp,
                //               color: BaseTheme.color_grey_8,
                //               fontFamily: BaseTheme.font_family_sf,
                //             )),
                //       ],
                //     ),
                //     SizedBox(
                //       width: 13.w,
                //     ),
                //     Radio(
                //       value: inSessionController.statusSet,
                //       groupValue: inSessionController.status,
                //       onChanged: (val) {
                //         // setState(() {
                //         //   radioButtonItem = 'TWO';
                //         //   id = 2;
                //         // });
                //       },
                //     ),
                //     Text(
                //       'Groups',
                //       style: TextStyle(
                //         fontSize: 16,
                //         color: BaseTheme.color_grey_8,
                //         fontFamily: BaseTheme.font_family_sf,
                //       ),
                //     ),
                //     SizedBox(
                //       width: 13.w,
                //     ),
                //     Radio(
                //       value: inSessionController.statusSet,
                //       groupValue: inSessionController.status,
                //       onChanged: (val) {
                //         // setState(() {
                //         //   radioButtonItem = 'TWO';
                //         //   id = 2;
                //         // });
                //       },
                //     ),
                //     Text(
                //       'Shared With',
                //       style: TextStyle(
                //         fontSize: 16.sp,
                //         color: BaseTheme.color_grey_8,
                //         fontFamily: BaseTheme.font_family_sf,
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    width: 328.w,
                    height: 56.h,
                    child: TextField(
                      controller: inSessionController.notesController,
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
                      onChanged: (tableCode) {
                        print(tableCode);
                      },
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
                        inSessionController.decrement();
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
                        inSessionController.count.value.toString(),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                      onTap: () {
                        inSessionController.increment();
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
                          inSessionController.addToCart(
                              false,
                              inSessionController
                                  .meIncludeItemModels.value.members?[0].id,
                              item.id,
                              inSessionController.notesController.text.trim(),
                              inSessionController.count.value);
                          print(item.id);
                          print(inSessionController
                              .meIncludeItemModels.value.members?[0].id);
                          print(inSessionController.count.value);
                          print(
                              inSessionController.notesController.text.trim());
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
