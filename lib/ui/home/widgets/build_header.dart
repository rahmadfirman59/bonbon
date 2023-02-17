// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:bonbon_new/controllers/home_controller.dart';
import 'package:bonbon_new/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildHeaderHome extends StatelessWidget {
  const BuildHeaderHome({Key? key, required this.controller}) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          // Get.toNamed(Routes.BANNER_DETAIL);
        },
        child: Container(
          height: 230,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              CarouselSlider.builder(
                itemCount: controller.imageUrl.length,
                itemBuilder: (context, index, realIndex) {
                  final listItem = controller.imageUrl[index];
                  return buildImage(listItem, index, context);
                },
                options: CarouselOptions(
                  viewportFraction: 5,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    controller.activeIndex.value = index;
                  },
                ),
              ),
              // InkWell(
              //   onTap: () {},
              //   child: Container(
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(40),
              //       ),
              //       height: 40.h,
              //       margin: EdgeInsets.fromLTRB(16, 30, 16, 16),
              //       child: Padding(
              //         padding:
              //             const EdgeInsets.only(top: 12, left: 12, bottom: 12),
              //         child: Row(
              //           children: [
              //             Icon(Icons.search),
              //             Text(
              //               'Search restaurant, or location',
              //               style: TextStyle(
              //                 fontSize: 12,
              //                 fontFamily: ('SanFransisco'),
              //               ),
              //             )
              //           ],
              //         ),
              //       )),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Container(
                  width: 328.w,
                  height: 40.h,
                  child: TextField(
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.r),
                        borderSide: BorderSide(color: Colors.grey, width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(48.r),
                        borderSide: BorderSide(color: Colors.grey, width: 0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 14.h),
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      fillColor: Colors.white,
                      hintText: "Search restaurant, or location",
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
              ),
              Positioned(
                top: 206,
                left: 24,
                child: buildIndicator(
                  controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index, BuildContext context) {
    return Image.network(
      'https://pwa-demo.bonbon.co.id/images/food-1.jpg',
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget buildIndicator(HomeController controller) {
    return AnimatedSmoothIndicator(
      activeIndex: controller.activeIndex.value,
      count: controller.imageUrl.length,
      effect: SlideEffect(
          spacing: 4.0,
          dotWidth: 8.0,
          dotHeight: 8.0,
          paintStyle: PaintingStyle.stroke,
          dotColor: Colors.grey,
          activeDotColor: BaseTheme.main_color),
    );
  }
}
