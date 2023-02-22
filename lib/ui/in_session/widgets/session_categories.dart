import 'package:bonbon_new/controllers/in_session_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SessionCategories extends StatelessWidget {
  const SessionCategories({Key? key, required this.inSessionController})
      : super(key: key);
  final InSessionController inSessionController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:
              inSessionController.menuLiteModels.value?.categories?.length,
          itemBuilder: (BuildContext context, int index) {
            var listItem =
                inSessionController.menuLiteModels.value?.categories?[index];
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
        )));
  }
}
