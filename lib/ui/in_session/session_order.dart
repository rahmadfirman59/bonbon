import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/controllers/session_order_controller.dart';
import 'package:bonbon_new/routes/routes_name.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/component/primray_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';

class SessionOrder extends StatefulWidget {
  const SessionOrder({Key? key}) : super(key: key);

  @override
  State<SessionOrder> createState() => _SessionOrderState();
}

class _SessionOrderState extends State<SessionOrder> {
  // SessionOrderController controller = Get.put(SessionOrderController());
  UniqueKey? keyTile;

  // void expandTile() {
  //   setState(() {
  //     isExpanded = true;
  //     keyTile = UniqueKey();
  //   });
  // }

  // void shrinkTile() {
  //   isExpanded = false;
  //   keyTile = UniqueKey();
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SessionOrderController>(
      init: SessionOrderController(),
      initState: (_) {},
      builder: (controller) {
        return buildBody(controller);
      },
    ); // ignore_for_file: prefer_const_constructors
  }

  Stack buildBody(SessionOrderController controller) {
    var sharedOrder =
        controller.orderInludeItemModels.value.orders!.where((element) {
      // return element
      return element.type == "for_all" || element.type == "for_member";
    }).toList();
    var myOrder =
        controller.orderInludeItemModels.value.orders!.where((element) {
      // return element
      return element.type == "only_me";
    }).toList();
    return Stack(
      children: [
        // Scaffold(
        //   appBar: AppBar(
        //     leading: IconButton(
        //       onPressed: () {
        //         Get.back();
        //       },
        //       icon: Icon(
        //         Icons.arrow_back,
        //         color: Colors.black,
        //       ),
        //     ),
        //     backgroundColor: Colors.white,
        //     centerTitle: true,
        //     title: Text(
        //       "Order Status",
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 20.sp,
        //           fontWeight: FontWeight.w800,
        //           fontFamily: BaseTheme.font_family_open),
        //     ),
        //   ),
        //   body: GetBuilder<SessionOrderController>(
        //     init: SessionOrderController(),
        //     initState: (_) {},
        //     builder: (controller) {
        //       return ListView.builder(
        //         itemCount: 2,
        //         itemBuilder: (BuildContext context, int index) {
        //           var sharedOrder = controller
        //               .orderInludeItemModels.value.orders!
        //               .where((element) {
        //             ;
        //             // return element
        //             return element.type == "for_all" ||
        //                 element.type == "for_member";
        //           }).toList();

        //           var myOrder = controller.orderInludeItemModels.value.orders!
        //               .where((element) {
        //             return element.type == controller.ordertype[0];
        //           }).toList();
        //           return Padding(
        //             padding: EdgeInsets.symmetric(horizontal: 8.w),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 SizedBox(
        //                   height: 16,
        //                 ),
        //                 Padding(
        //                   padding: EdgeInsets.symmetric(horizontal: 16.w),
        //                   child: Text(
        //                     controller.orderTitletype[index],
        //                     style: TextStyle(
        //                       fontFamily: BaseTheme.font_family_open,
        //                       fontWeight: FontWeight.w800,
        //                       fontSize: 16.sp,
        //                     ),
        //                   ),
        //                 ),
        //                 for (var items in order)
        //                   ListTile(
        //                     title: Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Text(
        //                           "${items.name}",
        //                           style: TextStyle(
        //                             fontFamily: BaseTheme.font_family_sf,
        //                             fontWeight: FontWeight.w800,
        //                             fontSize: 12.sp,
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     subtitle: Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Text(
        //                           "${GlobalHelper.currency} ${GlobalHelper.formatNumber(items.total.toString())}",
        //                           style: TextStyle(
        //                             fontFamily: BaseTheme.font_family_sf,
        //                             fontWeight: FontWeight.w400,
        //                             color: BaseTheme.color_grey_7,
        //                             fontSize: 12.sp,
        //                           ),
        //                         ),
        //                         ExpansionTile(
        //                           key: keyTile,
        //                           onExpansionChanged: (isExpanded) {
        //                             // setState(() {
        //                             //   isExpanded = !isExpanded;
        //                             //   print(isExpanded);
        //                             // });
        //                             controller.chngeIcon(isExpanded);
        //                           },
        //                           trailing: Container(
        //                             padding: EdgeInsets.symmetric(
        //                                 horizontal: 8.w, vertical: 4.h),
        //                             decoration: BoxDecoration(
        //                               color: items.status == "pending"
        //                                   ? BaseTheme.color_grey_4
        //                                   : items.status == "processing"
        //                                       ? Color(0xFFFFE606)
        //                                       : items.status == "served"
        //                                           ? BaseTheme.primary_color
        //                                           : Colors.red,
        //                               borderRadius: BorderRadius.circular(40),
        //                             ),
        //                             height: 22.h,
        //                             child: Text(
        //                               "${items.status}",
        //                               style: TextStyle(
        //                                 fontFamily: BaseTheme.font_family_sf,
        //                                 fontWeight: FontWeight.w400,
        //                                 color: items.status == "pending" ||
        //                                         items.status == "processing"
        //                                     ? Colors.black
        //                                     : Colors.white,
        //                                 fontSize: 12.sp,
        //                               ),
        //                             ),
        //                           ),
        //                           title: Container(
        //                             height: 40,
        //                             width: 100,
        //                             padding:
        //                                 EdgeInsets.symmetric(horizontal: 10),
        //                             decoration: BoxDecoration(
        //                               color: Color(0xFFFAFAFA),
        //                               borderRadius: BorderRadius.circular(40),
        //                             ),
        //                             child: Row(
        //                               children: [
        //                                 Text(
        //                                   "Details",
        //                                   style: TextStyle(
        //                                     fontFamily:
        //                                         BaseTheme.font_family_sf,
        //                                     fontWeight: FontWeight.w400,
        //                                     fontSize: 12.sp,
        //                                   ),
        //                                 ),
        //                                 Icon(
        //                                   controller.isExpanded
        //                                       ? Icons.keyboard_arrow_up
        //                                       : Icons
        //                                           .keyboard_arrow_down_outlined,
        //                                 )
        //                               ],
        //                             ),
        //                           ),
        //                           children: [
        //                             Container(
        //                               decoration: BoxDecoration(
        //                                   color: BaseTheme.color_grey_2),
        //                               height: 106.h,
        //                               child: Column(
        //                                 children: [
        //                                   Row(
        //                                     children: [
        //                                       Icon(Icons.person),
        //                                       SizedBox(
        //                                         width: 4.w,
        //                                       ),
        //                                       for (var person in items.members!)
        //                                         Text(
        //                                           "${person.name},",
        //                                           style: TextStyle(
        //                                             fontFamily: BaseTheme
        //                                                 .font_family_sf,
        //                                             fontWeight: FontWeight.w400,
        //                                             fontSize: 12.sp,
        //                                           ),
        //                                         )
        //                                     ],
        //                                   ),
        //                                   SizedBox(
        //                                     height: 16.h,
        //                                   ),
        //                                   Row(
        //                                     children: [
        //                                       Icon(Icons.description),
        //                                       SizedBox(
        //                                         width: 4.w,
        //                                       ),
        //                                       Text(
        //                                         items.note ?? "",
        //                                         style: TextStyle(
        //                                           fontFamily:
        //                                               BaseTheme.font_family_sf,
        //                                           fontWeight: FontWeight.w400,
        //                                           fontSize: 12.sp,
        //                                         ),
        //                                       )
        //                                     ],
        //                                   ),
        //                                   SizedBox(
        //                                     height: 16.h,
        //                                   ),
        //                                   Row(
        //                                     children: [
        //                                       Icon(Icons.description),
        //                                       SizedBox(
        //                                         width: 4.w,
        //                                       ),
        //                                       for (var modif
        //                                           in items.modifiers!)
        //                                         Text(
        //                                           "$modif,",
        //                                           style: TextStyle(
        //                                             fontFamily: BaseTheme
        //                                                 .font_family_sf,
        //                                             fontWeight: FontWeight.w400,
        //                                             fontSize: 12.sp,
        //                                           ),
        //                                         )
        //                                     ],
        //                                   )
        //                                 ],
        //                               ),
        //                             )
        //                           ],
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                 Divider(
        //                   height: 4,
        //                   color: BaseTheme.color_grey_4,
        //                 ),
        //               ],
        //             ),
        //           );
        //         },
        //       );
        //     },
        //   ),
        // ),
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
          body: GetBuilder<SessionOrderController>(
            init: SessionOrderController(),
            initState: (_) {},
            builder: (controller) {
              return sharedOrder.isNotEmpty || myOrder.isNotEmpty
                  ? ListView(
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        sharedOrder.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text(
                                  "Shared Order",
                                  style: TextStyle(
                                    fontFamily: BaseTheme.font_family_open,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                        for (var sOrder in sharedOrder)
                          ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${sOrder.name}",
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
                                  "${GlobalHelper.currency} ${GlobalHelper.formatNumber(sOrder.total.toString())}",
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
                                    // setState(() {
                                    //   isExpanded = !isExpanded;
                                    //   print(isExpanded);
                                    // });
                                    // controller.chngeIcon(isExpanded);
                                  },
                                  trailing: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                      color: sOrder.status == "pending"
                                          ? BaseTheme.color_grey_4
                                          : sOrder.status == "processing"
                                              ? Color(0xFFFFE606)
                                              : sOrder.status == "served"
                                                  ? BaseTheme.primary_color
                                                  : Colors.red,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    height: 22.h,
                                    child: Text(
                                      "${sOrder.status}",
                                      style: TextStyle(
                                        fontFamily: BaseTheme.font_family_sf,
                                        fontWeight: FontWeight.w400,
                                        color: sOrder.status == "pending" ||
                                                sOrder.status == "processing"
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                  title: Container(
                                    height: 40,
                                    width: 100,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Details",
                                          style: TextStyle(
                                            fontFamily:
                                                BaseTheme.font_family_sf,
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
                                              for (var person
                                                  in sOrder.members!)
                                                Text(
                                                  "${person.name},",
                                                  style: TextStyle(
                                                    fontFamily: BaseTheme
                                                        .font_family_sf,
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
                                                sOrder.note ?? "",
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
                                              for (var modif
                                                  in sOrder.modifiers!)
                                                Text(
                                                  "$modif,",
                                                  style: TextStyle(
                                                    fontFamily: BaseTheme
                                                        .font_family_sf,
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
                        myOrder.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text(
                                  "My Order",
                                  style: TextStyle(
                                    fontFamily: BaseTheme.font_family_open,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                        for (var mOrder in myOrder)
                          ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${mOrder.name}",
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
                                  "${GlobalHelper.currency} ${GlobalHelper.formatNumber(mOrder.total.toString())}",
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
                                    // setState(() {
                                    //   isExpanded = !isExpanded;
                                    //   print(isExpanded);
                                    // });
                                    // controller.chngeIcon(isExpanded);
                                  },
                                  trailing: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                      color: mOrder.status == "pending"
                                          ? BaseTheme.color_grey_4
                                          : mOrder.status == "processing"
                                              ? Color(0xFFFFE606)
                                              : mOrder.status == "served"
                                                  ? BaseTheme.primary_color
                                                  : Colors.red,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    height: 22.h,
                                    child: Text(
                                      "${mOrder.status}",
                                      style: TextStyle(
                                        fontFamily: BaseTheme.font_family_sf,
                                        fontWeight: FontWeight.w400,
                                        color: mOrder.status == "pending" ||
                                                mOrder.status == "processing"
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                  title: Container(
                                    height: 40,
                                    width: 100,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Details",
                                          style: TextStyle(
                                            fontFamily:
                                                BaseTheme.font_family_sf,
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
                                              for (var person
                                                  in mOrder.members!)
                                                Text(
                                                  "${person.name},",
                                                  style: TextStyle(
                                                    fontFamily: BaseTheme
                                                        .font_family_sf,
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
                                                mOrder.note ?? "",
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
                                              for (var modif
                                                  in mOrder.modifiers!)
                                                Text(
                                                  "$modif,",
                                                  style: TextStyle(
                                                    fontFamily: BaseTheme
                                                        .font_family_sf,
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
                        SizedBox(
                          height: 250,
                        )
                      ],
                    )
                  : ListView(
                      children: [
                        SizedBox(
                          height: 60.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 64.w),
                          width: 232.w,
                          height: 171.h,
                          child: Image.asset('assets/order/empty_order.png'),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 54.sp),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'You haven’t order anything\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18.sp,
                                    fontFamily: BaseTheme.font_family_open,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'your order status will be updated here',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    fontFamily: BaseTheme.font_family_sf,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
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
                child:
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text("Subtotal"),
                    //       Obx(
                    //         () => Text(
                    //           "${GlobalHelper.currency} ${GlobalHelper.formatNumber(controller.orderInludeItemModels.value.netTotal.toString())}",
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    ExpansionTile(
                  iconColor: Colors.black,
                  collapsedTextColor: Colors.yellow,
                  expandedAlignment: Alignment.topLeft,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: TextStyle(
                          fontFamily: BaseTheme.font_family_sf,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: BaseTheme.color_grey_8,
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${GlobalHelper.currency} ${GlobalHelper.formatNumber(controller.orderInludeItemModels.value.netTotal.toString())}",
                          style: TextStyle(
                            fontFamily: BaseTheme.font_family_sf,
                            fontWeight: FontWeight.w800,
                            fontSize: 14.sp,
                            color: BaseTheme.color_grey_9,
                          ),
                        ),
                      ),
                    ],
                  ),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "How would you like to pay?",
                            style: TextStyle(
                              fontFamily: BaseTheme.font_family_sf,
                              fontWeight: FontWeight.w800,
                              color: BaseTheme.color_grey_9,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Obx(
                            () => RadioGroup<String>.builder(
                              horizontalAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              direction: Axis.horizontal,
                              groupValue: controller.statusSet.toString(),
                              onChanged: (value) =>
                                  {controller.statusSet.value = value ?? ""},
                              items: controller.status,
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
                        SizedBox(
                          height: 10.h,
                        ),
                        Obx(
                          () => controller.statusSet.value == "Host the Meal"
                              ? Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    "You will pay for all the orders in these sessions?",
                                    style: TextStyle(
                                      fontFamily: BaseTheme.font_family_sf,
                                      fontWeight: FontWeight.w400,
                                      color: BaseTheme.color_grey_8,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                        ),
                        Obx(
                          () => controller.statusSet.value == "Host the Meal"
                              ? SizedBox(
                                  height: 10.h,
                                )
                              : SizedBox(
                                  height: 10.h,
                                ),
                        ),
                        Obx(
                          () => controller.statusSet.value == "Host the Meal"
                              ? Divider(
                                  color: BaseTheme.color_grey_4,
                                )
                              : SizedBox(
                                  height: 10.h,
                                ),
                        ),
                        Obx(
                          () => controller.statusSet.value == "Host the Meal"
                              ? SizedBox(
                                  height: 10.h,
                                )
                              : SizedBox(
                                  height: 10.h,
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub Total",
                                style: TextStyle(
                                  fontFamily: BaseTheme.font_family_sf,
                                  fontWeight: FontWeight.w400,
                                  color: BaseTheme.color_grey_8,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "${GlobalHelper.currency} ${GlobalHelper.formatNumber(controller.orderInludeItemModels.value.grossTotal.toString())}",
                                style: TextStyle(
                                  fontFamily: BaseTheme.font_family_sf,
                                  fontWeight: FontWeight.w400,
                                  color: BaseTheme.color_grey_8,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tax",
                                style: TextStyle(
                                  fontFamily: BaseTheme.font_family_sf,
                                  fontWeight: FontWeight.w400,
                                  color: BaseTheme.color_grey_8,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "${GlobalHelper.currency} ${GlobalHelper.formatNumber(controller.orderInludeItemModels.value.tax.toString())}",
                                style: TextStyle(
                                  fontFamily: BaseTheme.font_family_sf,
                                  fontWeight: FontWeight.w400,
                                  color: BaseTheme.color_grey_8,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Service Charge",
                                style: TextStyle(
                                  fontFamily: BaseTheme.font_family_sf,
                                  fontWeight: FontWeight.w400,
                                  color: BaseTheme.color_grey_8,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "${GlobalHelper.currency} ${GlobalHelper.formatNumber(controller.orderInludeItemModels.value.charge.toString())}",
                                style: TextStyle(
                                  fontFamily: BaseTheme.font_family_sf,
                                  fontWeight: FontWeight.w400,
                                  color: BaseTheme.color_grey_8,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    )
                  ],
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
                    Get.toNamed(RouteName.payment);
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
