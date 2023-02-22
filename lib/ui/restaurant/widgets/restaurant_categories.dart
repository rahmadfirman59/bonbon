// ignore_for_file: prefer_const_constructors

import 'package:bonbon_new/controllers/restaurant_controller.dart';
import 'package:flutter/material.dart';

class RestaurantCategories extends StatelessWidget {
  const RestaurantCategories({Key? key, required this.restaurantController})
      : super(key: key);

  final RestaurantController restaurantController;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:
              restaurantController.menuLiteModels.value?.categories?.length,
          itemBuilder: (BuildContext context, int index) {
            var listItem =
                restaurantController.menuLiteModels.value?.categories?[index];
            return Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  height: 32,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Color(0xFF5A8EE0))),
                  child: Text(listItem?.master?.name ?? ""),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            );
          },
        )
        // SizedBox(
        //   height: 32,
        //   child:
        // ListView(
        //   scrollDirection: Axis.horizontal,
        //   children: [
        //     Container(
        //       padding: EdgeInsets.all(8),
        //       height: 32,
        //       decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(40),
        //           border: Border.all(color: Color(0xFF5A8EE0))),
        //       child: Text(
        //         "Menu",
        //         style: TextStyle(
        //           color: Color(0xFF5A8EE0),
        //           fontFamily: ('SanFransisco'),
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       width: 8,
        //     ),
        //     Container(
        //       padding: EdgeInsets.all(8),
        //       height: 32,
        //       decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(40),
        //           border: Border.all(color: Color(0xFF5A8EE0))),
        //       child: Text(
        //         "Dessert",
        //         style: TextStyle(
        //           color: Color(0xFF5A8EE0),
        //           fontFamily: ('SanFransisco'),
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       width: 8,
        //     ),
        //     Container(
        //       padding: EdgeInsets.all(8),
        //       height: 32,
        //       decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(40),
        //           border: Border.all(color: Color(0xFF5A8EE0))),
        //       child: Text(
        //         "Appetizer",
        //         style: TextStyle(
        //           color: Color(0xFF5A8EE0),
        //           fontFamily: ('SanFransisco'),
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       width: 8,
        //     ),
        //     Container(
        //       padding: EdgeInsets.all(8),
        //       height: 32,
        //       decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(40),
        //           border: Border.all(color: Color(0xFF5A8EE0))),
        //       child: Text(
        //         "Drinks",
        //         style: TextStyle(
        //           color: Color(0xFF5A8EE0),
        //           fontFamily: ('SanFransisco'),
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       width: 8,
        //     ),
        //     Container(
        //       padding: EdgeInsets.all(8),
        //       height: 32,
        //       decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(40),
        //           border: Border.all(color: Color(0xFF5A8EE0))),
        //       child: Text(
        //         "Custom",
        //         style: TextStyle(
        //           color: Color(0xFF5A8EE0),
        //           fontFamily: ('SanFransisco'),
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       width: 8,
        //     ),
        //     Container(
        //       padding: EdgeInsets.all(8),
        //       height: 32,
        //       decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(40),
        //           border: Border.all(color: Color(0xFF5A8EE0))),
        //       child: Text(
        //         "Other",
        //         style: TextStyle(
        //           color: Color(0xFF5A8EE0),
        //           fontFamily: ('SanFransisco'),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        // ),
        );
  }
}
