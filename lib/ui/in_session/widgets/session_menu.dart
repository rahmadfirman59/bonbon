// ignore_for_file: prefer_const_constructors

import 'package:bonbon_new/controllers/helpers/global_helpers.dart';
import 'package:bonbon_new/controllers/in_session_controller.dart';
import 'package:bonbon_new/routes/routes_name.dart';
import 'package:bonbon_new/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SessionMenu extends StatelessWidget {
  const SessionMenu({
    Key? key,
    required this.inSessionController,
    required this.itemScrollController,
    required this.itemPositionsListener,
  }) : super(key: key);
  final InSessionController inSessionController;
  final ItemScrollController itemScrollController;
  final ItemPositionsListener itemPositionsListener;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 338.h,
      decoration: BoxDecoration(color: Colors.white),
      child: Obx(
        () => inSessionController.listView.value == true
            ? ScrollablePositionedList.builder(
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount:
                    inSessionController.menuLiteModels.value.categories!.length,
                itemBuilder: (BuildContext context, int index) {
                  var listItem = inSessionController
                      .menuLiteModels.value.categories![index];
                  var menus =
                      inSessionController.menuLiteModels.value.menus?.where(
                    (element) {
                      return element.categories?[0].master?.id ==
                          listItem.master!.id;
                    },
                  ).toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "${listItem.master?.name}",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16.sp,
                              fontFamily: BaseTheme.font_family_sf),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      for (var items in menus!)
                        ListTile(
                          leading: SizedBox(
                            width: 64,
                            height: 64,
                            child: items.images!.isNotEmpty
                                ? CachedNetworkImage(
                                    imageUrl: items.images?[0].original ?? "",
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Center(child: Icon(Icons.error)),
                                  )
                                : Lottie.network(
                                    'https://assets9.lottiefiles.com/packages/lf20_dggAm75MbY.json',
                                  ),
                          ),
                          title: Text(
                            items.fullName ?? "",
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
                                "${GlobalHelper.currency} ${GlobalHelper.formatNumber(items.price.toString())} ",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: BaseTheme.font_family_sf,
                                ),
                              ),
                            ],
                          ),
                          trailing: InkWell(
                            onTap: () {
                              // Get.toNamed(RouteName.session_pickfood,
                              //     arguments: [items]);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 6.h, horizontal: 10.w),
                              decoration: BoxDecoration(
                                  color: Color(0xFF40B7EA),
                                  borderRadius: BorderRadius.circular(20.r)),
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
                        )
                    ],
                  );
                },
              )
            : ScrollablePositionedList.builder(
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount:
                    inSessionController.menuLiteModels.value.categories!.length,
                itemBuilder: (BuildContext context, int index) {
                  var listItem = inSessionController
                      .menuLiteModels.value.categories![index];
                  var menus =
                      inSessionController.menuLiteModels.value.menus?.where(
                    (element) {
                      return element.categories?[0].master?.id ==
                          listItem.master!.id;
                    },
                  ).toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "${listItem.master?.name}",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16.sp,
                              fontFamily: BaseTheme.font_family_sf),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          childAspectRatio: 3 / 4,
                          mainAxisSpacing: 16,
                          children: <Widget>[
                            for (var items in menus!)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                  width: 155,
                                  height: 265,
                                  child: Column(
                                    children: [
                                      items.images!.isNotEmpty
                                          ? CachedNetworkImage(
                                              imageUrl:
                                                  items.images?[0].original ??
                                                      "",
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                width: 155.w,
                                                height: 100.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        value: downloadProgress
                                                            .progress),
                                              ),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Center(
                                                      child: Icon(Icons.error)),
                                            )
                                          : Lottie.network(
                                              width: 155.w,
                                              height: 100.h,
                                              'https://assets9.lottiefiles.com/packages/lf20_dggAm75MbY.json',
                                            ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: SizedBox(
                                          height: 28.h,
                                          width: 136.w,
                                          child: Text(
                                            items.fullName ?? "",
                                            style: TextStyle(
                                              color: BaseTheme.color_grey_9,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              fontFamily:
                                                  BaseTheme.font_family_sf,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: SizedBox(
                                          height: 18.h,
                                          width: 136.w,
                                          child: Text(
                                            "${GlobalHelper.currency} ${GlobalHelper.formatNumber(items.price.toString())} ",
                                            style: TextStyle(
                                              color: BaseTheme.color_grey_7,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              fontFamily:
                                                  BaseTheme.font_family_sf,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  RouteName.session_pickfood,
                                                  arguments: [items]);
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 6.h,
                                                    horizontal: 10.w),
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF40B7EA),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r)),
                                                width: 54.w,
                                                height: 24.h,
                                                child: Text(
                                                  "+ Add",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12.sp),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
