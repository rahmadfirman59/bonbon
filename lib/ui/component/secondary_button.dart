// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
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
              color: Color(0xFF5AA2CA),
            ), //content padding inside button
          ),
          onPressed: () {
            onPressed;
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5AA2CA),
              fontFamily: ('SanFransisco'),
            ),
          ),
        ),
      ),
    );
  }
}
