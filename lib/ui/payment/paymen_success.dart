// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/controllers/payment_success_controller.dart';
import 'package:bonbon_new/routes/routes_name.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/component/primray_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentSuccessController>(
      init: PaymentSuccessController(),
      initState: (_) {},
      builder: (controller) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  "Payment Success",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: BaseTheme.font_family_open),
                ),
              ),
              body: ListView(
                children: [
                  SizedBox(
                    height: 18.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 64.w),
                    width: 232.w,
                    height: 171.h,
                    child: Image.asset('assets/payment/success.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 338.h,
                      decoration: BoxDecoration(
                        color: BaseTheme.color_grey_2,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Transaction",
                              ),
                              Text(
                                "${controller.paymentSummaryModels.value.table?.name}",
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Retaurant",
                              ),
                              Text(
                                "${controller.paymentSummaryModels.value.restaurant?.name}",
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order Number",
                              ),
                              Text(
                                "${controller.paymentSummaryModels.value.order?.number}",
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Time",
                              ),
                              Text(
                                "${controller.paymentSummaryModels.value.order?.time}",
                              )
                            ],
                          ),
                          Divider(),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                              ),
                              Text(
                                "${GlobalHelper.currency} ${GlobalHelper.formatNumber(controller.paymentSummaryModels.value.order!.subTotal.toString())}",
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "+ Fee",
                              ),
                              Text(
                                "(${controller.paymentSummaryModels.value.order?.feeRate}) ${GlobalHelper.currency} ${GlobalHelper.formatNumber(controller.paymentSummaryModels.value.order!.fee.toString())} ",
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "+Tax",
                              ),
                              Text(
                                "(${controller.paymentSummaryModels.value.order?.taxRate}) ${GlobalHelper.currency} ${GlobalHelper.formatNumber(controller.paymentSummaryModels.value.order!.tax.toString())} ",
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Grand Total",
                              ),
                              Text(
                                "${GlobalHelper.currency} ${GlobalHelper.formatNumber(controller.paymentSummaryModels.value.order!.grandTotal.toString())} ",
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment Method",
                              ),
                              Text(
                                "${controller.paymentSummaryModels.value.order?.paymentMethod}",
                              )
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40.h,
                                width: 136.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFF5A8EE0),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.mail,
                                      color: Color(0xFF5A8EE0),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      "Email Me",
                                      style: TextStyle(
                                        fontFamily: BaseTheme.font_family_sf,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF5A8EE0),
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 40.h,
                                width: 136.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFF5A8EE0),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.download,
                                      color: Color(0xFF5A8EE0),
                                    ),
                                    Text(
                                      "Download",
                                      style: TextStyle(
                                        fontFamily: BaseTheme.font_family_sf,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF5A8EE0),
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
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
                  text: "Back To Home",
                  isValid: true,
                  onPressed: () {
                    Get.toNamed(RouteName.payment);
                    // cartController.order();
                  },
                  fontSize: 16.sp,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
