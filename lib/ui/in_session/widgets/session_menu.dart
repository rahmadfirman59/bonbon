// ignore_for_file: prefer_const_constructors

import 'package:bonbon_new/controllers/in_session_controller.dart';
import 'package:bonbon_new/routes/routes_name.dart';
import 'package:bonbon_new/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

class SessionMenu extends StatelessWidget {
  const SessionMenu({Key? key, required this.inSessionController})
      : super(key: key);
  final InSessionController inSessionController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 338.h,
      decoration: BoxDecoration(color: Colors.white),
      child: Obx(
        () => inSessionController.menuLiteModels.value!.categories!.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: inSessionController
                    .menuLiteModels.value?.categories?.length,
                itemBuilder: (BuildContext context, int index) {
                  var listItem = inSessionController
                      .menuLiteModels.value?.categories?[index];
                  var menus =
                      inSessionController.menuLiteModels.value?.menus?.where(
                    (element) {
                      return element.categories?[0].master?.id ==
                          listItem?.master!.id;
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
                          "${listItem?.master?.name}",
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
                                " Rp ${items.price.toString()}",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: BaseTheme.font_family_sf,
                                ),
                              ),
                            ],
                          ),
                          trailing: InkWell(
                            onTap: () {
                              Get.toNamed(RouteName.session_pickfood,
                                  arguments: [items]);
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
              ),
      ),
    );
  }
}
