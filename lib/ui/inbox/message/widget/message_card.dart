// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  final bool? isRead;
  final String trailing;
  const MessageCard(
      {Key? key,
      this.image,
      this.title,
      this.subtitle,
      this.isRead = false,
      required this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: isRead == false
          ? BoxDecoration(color: Colors.white)
          : BoxDecoration(color: Color(0xFFC7FFE4)),
      child: ListTile(
        leading: Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFBFBFBF),
            ),
            child: Image(
              image: AssetImage(image ?? ''),
            )),
        title: Text(
          title ?? "",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: ('SanFransisco'),
          ),
        ),
        subtitle: Text(
          subtitle ?? "",
          style: TextStyle(
            fontFamily: ('SanFransisco'),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              trailing,
              style: TextStyle(
                fontFamily: ('SanFransisco'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
