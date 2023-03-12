// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:bonbon_new/controllers/cart_controller.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/component/primray_button.dart';
import 'package:expandable/expandable.dart';

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
                        padding: EdgeInsets.all(16),
                        child: ListTile(
                            title: Text(
                              "${listItem?.item?.fullName}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                  fontFamily: BaseTheme.font_family_sf),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ExpandablePanel(
                                header: Text("Details"),
                                collapsed: Text(
                                  "",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                expanded: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                        ),
                                        Text(
                                            "${listItem?.members?[0].user?.name}")
                                      ],
                                    ),
                                    listItem!.modifiers!.isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(
                                                Icons.note_add,
                                              ),
                                              Text(
                                                  "${listItem.modifiers?[0].master?.name}")
                                            ],
                                          )
                                        : SizedBox.shrink()
                                  ],
                                ),
                              ),
                            ),
                            trailing:
                                Icon(Icons.keyboard_arrow_right_outlined)),
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
                      Obx(() => Text(
                            "${cartController.cartTotal.value.toString()}",
                          )),
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
