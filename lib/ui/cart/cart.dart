// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:bonbon_new/controllers/cart_controller.dart';
import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/component/primray_button.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "Your Basket",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: BaseTheme.font_family_open),
            ),
          ),
          body: Obx(
            () => cartController.cartItemModels.value!.items!.isNotEmpty
                ? ListView.builder(
                    itemCount:
                        cartController.cartItemModels.value?.items!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var listItem =
                          cartController.cartItemModels.value?.items![index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        child: ListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${listItem?.item?.fullName}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp,
                                        fontFamily: BaseTheme.font_family_sf),
                                  ),
                                  Text(
                                    "${GlobalHelper.currency} ${GlobalHelper.formatNumber(listItem!.item!.price.toString())}",
                                    style: TextStyle(
                                      fontFamily: BaseTheme.font_family_sf,
                                      fontWeight: FontWeight.w400,
                                      color: BaseTheme.color_grey_9,
                                      fontSize: 12.sp,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 24.h,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // sessionPickFoodcontroller.decrement();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFEE00),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                          ),
                                        ),
                                        width: 32,
                                        height: 32,
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Color(0xFFFFEE00).withOpacity(0.3),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w, vertical: 4.h),
                                      width: 31.w,
                                      height: 24.h,
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                          color: BaseTheme.color_grey_8,
                                          fontFamily: BaseTheme.font_family_sf,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // sessionPickFoodcontroller.increment();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFEE00),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                          ),
                                        ),
                                        width: 32,
                                        height: 32,
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ExpansionTile(
                                tilePadding: EdgeInsets.all(0),
                                trailing: SizedBox(
                                  width: 90.w,
                                  height: 20.h,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.delete,
                                        size: 16,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        "Remove",
                                        style: TextStyle(
                                          color: BaseTheme.color_grey_8,
                                          fontFamily: BaseTheme.font_family_sf,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                title: Container(
                                  height: 40,
                                  width: 100,
                                  padding: EdgeInsets.all(0),
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
                                            for (var person
                                                in listItem.members!)
                                              Text(
                                                "${person.user?.name},",
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
                                              listItem.notes ?? "",
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
                                                in listItem.modifiers!)
                                              Text(
                                                "${modif.master?.name}",
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
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Lottie.network(
                          'https://assets9.lottiefiles.com/private_files/lf30_e3pteeho.json'),
                      Text(
                        "Your Cart is Empty",
                        style: TextStyle(
                            fontFamily: BaseTheme.font_family_sf,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      // Text(
                      //   "New Session is being approved",
                      //   style: TextStyle(
                      //       fontFamily: BaseTheme.font_family_sf,
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.w400),
                      // )
                    ],
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
                            "${GlobalHelper.currency} ${GlobalHelper.formatNumber(cartController.cartTotal.value.toString())}"),
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
                  text: "Order Now",
                  isValid: true,
                  onPressed: () {
                    cartController.order();
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
