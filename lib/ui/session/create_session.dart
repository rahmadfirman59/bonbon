// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:bonbon_new/controllers/create_session_controller.dart';
import 'package:bonbon_new/controllers/helpers/global_helpers.dart';

import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/component/primray_button.dart';

import 'package:bonbon_new/ui/component/third_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class CreateSession extends StatelessWidget {
  const CreateSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateSessionController createSessionController =
        Get.put(CreateSessionController());
    // createSessionController.getSessionTable(Get.arguments[0] ?? "");
    createSessionController.tableCode.value = Get.arguments[1];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Table Session",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              fontFamily: BaseTheme.font_family_open),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              CupertinoIcons.qrcode_viewfinder,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Obx(
        () => Stack(
          children: [
            createSessionController.checkTableSessionModel.isNotEmpty
                ? ListView(
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: BaseTheme.color_grey_8,
                                fontSize: 14.sp,
                                fontFamily: BaseTheme.font_family_sf,
                                fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'There’s multiple session opened at this table,',
                              ),
                              TextSpan(
                                text:
                                    'would you like join existing session or create new ',
                              ),
                              TextSpan(
                                text: 'sessions',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          "Join Session",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: BaseTheme.color_grey_9,
                              fontFamily: BaseTheme.font_family_open,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: 328,
                          height: 36,
                          color: BaseTheme.color_grey_2,
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 20,
                                child: Text(
                                  "Time",
                                  style: TextStyle(
                                      color: BaseTheme.color_grey_7,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: BaseTheme.font_family_sf),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 42,
                                height: 20,
                                child: Text(
                                  "Pax",
                                  style: TextStyle(
                                      color: BaseTheme.color_grey_7,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: BaseTheme.font_family_sf),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 214,
                                height: 20,
                                child: Text(
                                  "Table Admin",
                                  style: TextStyle(
                                      color: BaseTheme.color_grey_7,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: BaseTheme.font_family_sf),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Container(
                          height: 156,
                          child: ListView.builder(
                            itemCount: createSessionController
                                .checkTableSessionModel.length,
                            itemBuilder: (BuildContext context, int index) {
                              var listItem = createSessionController
                                  .checkTableSessionModel[index];
                              return InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      isScrollControlled: true,
                                      isDismissible: true,
                                      builder: (context) => buildSheet(
                                          listItem.orders!,
                                          listItem.members?[0].user?.name,
                                          listItem.pax,
                                          listItem.netTotal));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  width: 328,
                                  height: 36,
                                  color: BaseTheme.color_grey_2,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 48,
                                        height: 20,
                                        child: Text(
                                          '${GlobalHelper.timeFormat.format(listItem.createdAt!)}',
                                          style: TextStyle(
                                              color: BaseTheme.color_grey_8,
                                              fontWeight: FontWeight.w400,
                                              fontFamily:
                                                  BaseTheme.font_family_sf),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        width: 42,
                                        height: 20,
                                        child: Text(
                                          "${listItem.pax}",
                                          style: TextStyle(
                                              color: BaseTheme.color_grey_8,
                                              fontWeight: FontWeight.w400,
                                              fontFamily:
                                                  BaseTheme.font_family_sf),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        width: 214,
                                        height: 20,
                                        child: Text(
                                          "${listItem.members?[0].user?.name}",
                                          style: TextStyle(
                                              color: BaseTheme.color_grey_9,
                                              fontWeight: FontWeight.w700,
                                              fontFamily:
                                                  BaseTheme.font_family_sf),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          "Create New Session",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: BaseTheme.color_grey_9,
                              fontFamily: BaseTheme.font_family_open,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 209.w,
                              height: 56.h,
                              child: TextField(
                                controller: createSessionController
                                    .personController.value,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 14.h),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Maximum Person",
                                  hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: BaseTheme.color_grey_7,
                                      fontFamily: BaseTheme.font_family_sf,
                                      fontWeight: FontWeight.w400),
                                ),
                                onChanged: (phone) {
                                  // loginController.phoneNumber.value = phone;
                                  // debugPrint(loginController.phoneNumber.value);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                createSessionController.decrement();
                              },
                              child: Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: BaseTheme.main_color,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: BaseTheme.main_color,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                createSessionController.increment();
                              },
                              child: Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: BaseTheme.main_color,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: BaseTheme.main_color,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              //only check box
                              value: createSessionController
                                  .checkInvite.value, //unchecked
                              onChanged: (bool? value) {
                                createSessionController.checkInvite.value =
                                    value!;
                                //value returned when checkbox is clicked
                              },
                            ),
                            Text(
                              "Invitation Only",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: BaseTheme.color_grey_8,
                                  fontFamily: BaseTheme.font_family_sf,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : ListView(
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          "Create New Session",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: BaseTheme.color_grey_9,
                              fontFamily: BaseTheme.font_family_open,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 209.w,
                              height: 56.h,
                              child: TextField(
                                controller: createSessionController
                                    .personController.value,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 14.h),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Maximum Person",
                                  hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: BaseTheme.color_grey_7,
                                      fontFamily: BaseTheme.font_family_sf,
                                      fontWeight: FontWeight.w400),
                                ),
                                onChanged: (phone) {
                                  // loginController.phoneNumber.value = phone;
                                  // debugPrint(loginController.phoneNumber.value);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                createSessionController.decrement();
                              },
                              child: Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: BaseTheme.main_color,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: BaseTheme.main_color,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                createSessionController.increment();
                              },
                              child: Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: BaseTheme.main_color,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: BaseTheme.main_color,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              //only check box
                              value: createSessionController
                                  .checkInvite.value, //unchecked
                              onChanged: (bool? value) {
                                createSessionController.checkInvite.value =
                                    value!;
                                //value returned when checkbox is clicked
                              },
                            ),
                            Text(
                              "Invitation Only asd",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: BaseTheme.color_grey_8,
                                  fontFamily: BaseTheme.font_family_sf,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ],
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
                child: ThirdButton(
                  fontSize: 16,
                  text: "Create New Session",
                  onPressed: () {
                    createSessionController.createSession(
                        createSessionController.personController.value!.text
                            .trim(),
                        Get.arguments[0],
                        Get.arguments[1]);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSheet(List<dynamic> sessioSharedOrder, String? leader, int? pax,
      dynamic netTotal) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      maxChildSize: 1,
      minChildSize: 0.2,
      builder: (_, controller) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height: 700,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 39.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "Are you ready to join session",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: BaseTheme.color_grey_9,
                          fontFamily: BaseTheme.font_family_open,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 36.h,
                      color: BaseTheme.color_grey_2,
                      child: Row(
                        children: [
                          Container(
                            height: 24.w,
                            child: Icon(
                              LineIcons.checkCircle,
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            width: 11.w,
                          ),
                          Container(
                            width: 207.w,
                            height: 20,
                            child: Text(
                              "${leader}",
                              style: TextStyle(
                                  color: BaseTheme.color_grey_7,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: BaseTheme.font_family_sf),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 49.w,
                            height: 20.h,
                            child: Text(
                              "${pax} pax",
                              style: TextStyle(
                                  color: BaseTheme.color_grey_7,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: BaseTheme.font_family_sf),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "The session has shared orders :",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          fontFamily: BaseTheme.font_family_sf),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 194.h,
                    child: ListView.builder(
                      itemCount: sessioSharedOrder.length,
                      itemBuilder: (BuildContext context, int index) {
                        var listItem = sessioSharedOrder[index];
                        return listItem["type"] == "for_all"
                            ? ListTile(
                                leading: Image.network(listItem["variant"]
                                        ["images"][0]["thumb"]
                                    .toString()),
                                title: Text(
                                  listItem["name"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp,
                                      fontFamily: BaseTheme.font_family_sf),
                                ),
                                subtitle: Text(
                                  listItem["price"].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      fontFamily: BaseTheme.font_family_sf),
                                ),
                                trailing: Text(listItem["type"]),
                              )
                            : SizedBox.shrink();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 31.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      color: BaseTheme.color_grey_2,
                      width: double.infinity,
                      height: 63,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(
                                color: BaseTheme.color_grey_8,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                fontFamily: BaseTheme.font_family_sf),
                          ),
                          Text("Rp ${netTotal}",
                              style: TextStyle(
                                  color: BaseTheme.color_grey_8,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  fontFamily: BaseTheme.font_family_sf)),
                        ],
                      ),
                    ),
                  )
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
                child: PrimaryButton(
                  isValid: true,
                  fontSize: 16,
                  text: "Join Now",
                  onPressed: () {
                    // createSessionController.createSession(
                    //     Get.arguments[1], Get.arguments[0]);
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
