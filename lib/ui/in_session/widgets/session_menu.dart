// ignore_for_file: prefer_const_constructors

import 'package:bonbon_new/controllers/in_session_controller.dart';
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
        () => ListView.builder(
          itemCount: inSessionController.menuLiteModels.value?.menus?.length,
          itemBuilder: (BuildContext context, int index) {
            var listItem =
                inSessionController.menuLiteModels.value?.menus?[index];
            if (listItem!.images!.isNotEmpty) {
              return inSessionController.menuLiteModels.value?.menus?.length ==
                      0
                  ? CircularProgressIndicator()
                  : ListTile(
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
                              "Member id ${inSessionController.meIncludeItemModels.value?.members?[0].id}");
                          debugPrint("Menu Id id ${listItem.id}");
                          // inSessionController.addToCart(
                          //     restaurantController
                          //         .meIncludeItemModels.value?.members?[0].id,
                          //     listItem.id);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.h, horizontal: 10.w),
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
