// ignore_for_file: prefer_const_constructors

import 'package:bonbon_new/theme.dart';
import 'package:flutter/material.dart';

class ThirdButton extends StatelessWidget {
  const ThirdButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.fontSize})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFFFFFFF),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(15),
            side: BorderSide(
              width: 1,
              color: Color(0xFF00CC36),
            ), //content padding inside button
          ),
          onPressed: () {
            onPressed();
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              color: BaseTheme.main_color,
              fontFamily: BaseTheme.font_family_sf,
            ),
          ),
        ),
      ),
    );
  }
}
