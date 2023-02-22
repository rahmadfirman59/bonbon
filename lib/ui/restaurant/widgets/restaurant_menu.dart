// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bonbon_new/controllers/restaurant_controller.dart';
import 'package:bonbon_new/theme.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RestaurantMenu extends StatelessWidget {
  const RestaurantMenu({Key? key, required this.restaurantController})
      : super(key: key);
  final RestaurantController restaurantController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(color: Colors.white),
      child:
          //  ListView(
          //   physics: NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(16, 16, 12, 12),
          //       child: Text(
          //         "Popular Menu",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontFamily: ('SanFransisco'),
          //         ),
          //       ),
          //     ),
          //     RestaurantCardMenu(
          //       image: 'assets/outlets/menu1.png',
          //       name: "Banana and Mandarin Buns",
          //       price: "Rp 50.000",
          //       rating: "4.3",
          //     ),
          //     SizedBox(
          //       height: 24,
          //     ),
          //     RestaurantCardMenu(
          //       image: 'assets/outlets/menu2.png',
          //       name: "Sweet Potato Breakfast Hashwith dates and strawberry",
          //       price: "Rp 50.000",
          //       rating: "4.3",
          //     ),
          //     SizedBox(
          //       height: 24,
          //     ),
          //     RestaurantCardMenu(
          //       image: 'assets/outlets/menu3.png',
          //       name: "Tofu Vegetable Fried Rice",
          //       price: "Rp 50.000",
          //       rating: "4.3",
          //     ),
          //     SizedBox(
          //       height: 24,
          //     ),
          //     RestaurantCardMenu(
          //       image: 'assets/outlets/menu4.png',
          //       name: "Nut Butter Snack Bites",
          //       price: "Rp 50.000",
          //       rating: "4.3",
          //     ),
          //     SizedBox(
          //       height: 24,
          //     ),
          //     RestaurantCardMenu(
          //       image: 'assets/outlets/menu5.png',
          //       name: "Veggie Bacon Egg & Cheese",
          //       price: "Rp 50.000",
          //       rating: "4.3",
          //     ),
          //     SizedBox(
          //       height: 16,
          //     ),
          //     Divider(
          //       thickness: 4,
          //       color: Color(0xFFE8E8E8),
          //     ),
          //     SizedBox(
          //       height: 16,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(16, 16, 12, 12),
          //       child: Text(
          //         "Standart Menu",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontFamily: ('SanFransisco'),
          //         ),
          //       ),
          //     ),
          //     RestaurantCardMenu(
          //       image: 'assets/outlets/menu6.png',
          //       name: "Buffalo Cauli Bites",
          //       price: "Rp 50.000",
          //       rating: "4.3",
          //     ),
          //     SizedBox(
          //       height: 24,
          //     ),
          //     RestaurantCardMenu(
          //       image: 'assets/outlets/menu7.png',
          //       name: "Banana and Mandarin Buns",
          //       price: "Rp 50.000",
          //       rating: "4.3",
          //     ),
          //     SizedBox(
          //       height: 24,
          //     ),
          //     RestaurantCardMenu(
          //       image: 'assets/outlets/menu8.png',
          //       name: "Banana and Mandarin Buns",
          //       price: "Rp 50.000",
          //       rating: "4.3",
          //     ),
          //     SizedBox(
          //       height: 16,
          //     ),
          //     Divider(
          //       thickness: 4,
          //       color: Color(0xFFE8E8E8),
          //     ),
          //     SizedBox(
          //       height: 16,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(16, 16, 12, 12),
          //       child: Text(
          //         "Drinks",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontFamily: ('SanFransisco'),
          //         ),
          //       ),
          //     ),
          //     RestaurantCardMenu(
          //       image: 'assets/outlets/menu9.png',
          //       name: "Mix Juice",
          //       price: "Rp 50.000",
          //       rating: "4.3",
          //     ),
          //     SizedBox(
          //       height: 24,
          //     ),
          //     RestaurantCardMenu(
          //       image: 'assets/outlets/menu10.png',
          //       name: "Alcohol Drink",
          //       price: "Rp 50.000",
          //       rating: "4.3",
          //     ),
          //     SizedBox(
          //       height: 24,
          //     ),
          //     RestaurantCardMenu(
          //       image: 'assets/outlets/menu11.png',
          //       name: "Mocktails",
          //       price: "Rp 50.000",
          //       rating: "4.3",
          //     ),
          //     SizedBox(
          //       height: 16,
          //     ),
          //     Divider(
          //       thickness: 4,
          //       color: Color(0xFFE8E8E8),
          //     ),
          //     SizedBox(
          //       height: 16,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(16, 16, 12, 12),
          //       child: Text(
          //         "Utensils",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontFamily: ('SanFransisco'),
          //         ),
          //       ),
          //     ),
          //     RestaurantCardMenu(
          //       image: 'assets/outlets/menu12.png',
          //       name: "Spoon",
          //       price: "Rp 0",
          //       rating: "",
          //     ),
          //     SizedBox(
          //       height: 24,
          //     ),
          //     RestaurantCardMenu(
          //       image: 'assets/outlets/menu13.png',
          //       name: "Fork",
          //       price: "Rp 0",
          //       rating: "0",
          //     ),
          //     SizedBox(
          //       height: 24,
          //     ),
          //     RestaurantCardMenu(
          //       image: 'assets/outlets/menu11.png',
          //       name: "Chopsticks",
          //       price: "0",
          //       rating: "4.3",
          //     ),
          //     SizedBox(
          //       height: 24,
          //     ),
          //   ],
          // ),
          Obx(
        () => ListView.builder(
          itemCount: restaurantController.menuLiteModels.value?.menus?.length,
          itemBuilder: (BuildContext context, int index) {
            var listItem =
                restaurantController.menuLiteModels.value?.menus?[index];
            if (listItem!.images!.isNotEmpty) {
              return ListTile(
                leading: SizedBox(
                  width: 64,
                  height: 64,
                  child: CachedNetworkImage(
                    imageUrl: listItem.images?[0].original ?? "",
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) =>
                        Center(child: Icon(Icons.error)),
                  ),
                ),
                title: Text(
                  listItem.fullName ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: BaseTheme.font_family_sf,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Rp ${listItem.price.toString()}",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: BaseTheme.font_family_sf,
                      ),
                    ),
                  ],
                ),
                trailing: InkWell(
                  onTap: () {
                    debugPrint(
                        "Member id ${restaurantController.meIncludeItemModels.value?.members?[0].id}");
                    debugPrint("Menu Id id ${listItem.id}");
                    restaurantController.addToCart(
                        restaurantController
                            .meIncludeItemModels.value?.members?[0].id,
                        listItem.id);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                        color: Color(0xFF40B7EA),
                        borderRadius: BorderRadius.circular(10)),
                    width: 54.w,
                    height: 24.h,
                    child: Text(
                      "+ Add",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                  ),
                ),
              );
            } else {
              return ListTile(
                leading: Lottie.network(
                  'https://assets9.lottiefiles.com/packages/lf20_dggAm75MbY.json',
                ),
                title: Text(
                  listItem.fullName ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: BaseTheme.font_family_sf,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Rp ${listItem.price.toString()}",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: BaseTheme.font_family_sf,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
