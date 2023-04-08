// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/controllers/payment_controller.dart';
import 'package:bonbon_new/routes/routes_name.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/component/primray_button.dart';
import 'package:bonbon_new/ui/payment/pay_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xendit/xendit.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      init: PaymentController(),
      initState: (_) {},
      builder: (controller) {
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
                  "Payment",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: BaseTheme.font_family_open),
                ),
              ),
              body: ListView(
                children: [
                  ExpansionTile(
                    expandedCrossAxisAlignment: CrossAxisAlignment.end,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontFamily: BaseTheme.font_family_sf,
                            fontWeight: FontWeight.w800,
                            color: BaseTheme.color_grey_9,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          "${GlobalHelper.currency} ${GlobalHelper.formatNumber(controller.subTotal.toString())}",
                          style: TextStyle(
                            fontFamily: BaseTheme.font_family_sf,
                            fontWeight: FontWeight.w800,
                            color: BaseTheme.color_grey_9,
                            fontSize: 14.sp,
                          ),
                        )
                      ],
                    ),
                    children: [
                      for (var item in controller
                          .orderMeIncludeItemMenuModels.value.orders!)
                        ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 200.w,
                                child: Text(
                                  "${item.qty} x ${item.name}",
                                  style: TextStyle(
                                    fontFamily: BaseTheme.font_family_sf,
                                    fontWeight: FontWeight.w400,
                                    color: BaseTheme.color_grey_9,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.person),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "${GlobalHelper.currency} ${GlobalHelper.formatNumber(item.myTotal.toString())}",
                                style: TextStyle(
                                  fontFamily: BaseTheme.font_family_sf,
                                  fontWeight: FontWeight.w800,
                                  color: BaseTheme.color_grey_9,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      // ListTile(
                      //   title: Text(
                      //     "Fee",
                      //     style: TextStyle(
                      //       fontFamily: BaseTheme.font_family_sf,
                      //       fontWeight: FontWeight.w400,
                      //       color: BaseTheme.color_grey_9,
                      //       fontSize: 12.sp,
                      //     ),
                      //   ),
                      //   trailing: Text(
                      //     "${GlobalHelper.currency} ${GlobalHelper.formatNumber(controller.orderMeIncludeItemMenuModels.value.sumCharge)}",
                      //     style: TextStyle(
                      //       fontFamily: BaseTheme.font_family_sf,
                      //       fontWeight: FontWeight.w400,
                      //       color: BaseTheme.color_grey_9,
                      //       fontSize: 12.sp,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 22,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Text(
                          "Transfer Virtual Account",
                          style: TextStyle(
                            fontFamily: BaseTheme.font_family_open,
                            fontWeight: FontWeight.w800,
                            fontSize: 16.sp,
                            color: BaseTheme.color_grey_6,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(PayView(
                              bankVa: "mandiri",
                              invoiceId: controller.payViewModels.value.id!));
                        },
                        leading: Image.asset('assets/bank/Mandiri.png'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 14,
                          color: BaseTheme.color_grey_8,
                        ),
                        title: Text(
                          "Mandiri",
                          style: TextStyle(
                            fontFamily: BaseTheme.font_family_sf,
                            fontWeight: FontWeight.w800,
                            fontSize: 14.sp,
                            color: BaseTheme.color_grey_9,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(PayView(
                              bankVa: "bca",
                              invoiceId: controller.payViewModels.value.id!));
                        },
                        leading: Image.asset('assets/bank/BCA.png'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 14,
                          color: BaseTheme.color_grey_8,
                        ),
                        title: Text(
                          "BCA",
                          style: TextStyle(
                            fontFamily: BaseTheme.font_family_sf,
                            fontWeight: FontWeight.w800,
                            fontSize: 14.sp,
                            color: BaseTheme.color_grey_9,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(PayView(
                              bankVa: "bri",
                              invoiceId: controller.payViewModels.value.id!));
                        },
                        leading: Image.asset('assets/bank/BRIVA.png'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 14,
                          color: BaseTheme.color_grey_8,
                        ),
                        title: Text(
                          "BRI",
                          style: TextStyle(
                            fontFamily: BaseTheme.font_family_sf,
                            fontWeight: FontWeight.w800,
                            fontSize: 14.sp,
                            color: BaseTheme.color_grey_9,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(PayView(
                              bankVa: "bni",
                              invoiceId: controller.payViewModels.value.id!));
                        },
                        leading: Image.asset('assets/bank/BNI.png'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 14,
                          color: BaseTheme.color_grey_8,
                        ),
                        title: Text(
                          "BNI",
                          style: TextStyle(
                            fontFamily: BaseTheme.font_family_sf,
                            fontWeight: FontWeight.w800,
                            fontSize: 14.sp,
                            color: BaseTheme.color_grey_9,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Container(
            //         width: double.infinity,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey.withOpacity(0.5),
            //               spreadRadius: 2,
            //               blurRadius: 2,
            //               offset: Offset(0, 2),
            //             ),
            //           ],
            //         ),
            //         child: PrimaryButton(
            //           text: "Pay",
            //           isValid: true,
            //           onPressed: () {
            //             Get.toNamed(RouteName.pay_view);
            //             // cartController.order();
            //           },
            //           fontSize: 16.sp,
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        );
      },
    );
  }
}
