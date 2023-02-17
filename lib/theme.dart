// ignore_for_file: constant_identifier_names, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

/// Theme utama untuk aplikasi
class BaseTheme {
  static const Color main_color = Color(0xFF08E179);
  static Color alternate_color = Color(0xFF30BE76);
  static Color secondary_color = Color(0xFFFFE606);
  static Color primary_color = Color(0xFF00CC36);
  static Color soft_color = Color(0xFFC7FFE4);
  static Color color_grey_1 = Color(0xFFFFFFFF);
  static Color color_grey_2 = Color(0xFFFAFAFA);
  static Color color_grey_4 = Color(0xFFE8E8E8);
  static Color color_grey_5 = Color(0xFFD9D9D9);
  static Color color_grey_6 = Color(0xFFBFBFBF);
  static Color color_grey_8 = Color(0xFF595959);
  static Color color_grey_9 = Color(0xFF262626);
  static Color color_grey_7 = Color(0xFF8C8C8C);
  static Color mutedColor = Color(0xFF999999);
  static const Color bg_color = Color(0xFFEFEFEF);
  static const double font_size = 15;
  static const int element_spacing = 15;
  static const double rounded_corner = 13;
  static const double button_rounded_corner = 30;
  static const Color border_color = Color(0xFFCECECE);
  static const String font_family = "Poppins";
  static const String font_family_sf = "SanFransisco";
  static const String font_family_open = "OpenSans";

  static const double INPUT_Y_MARGIN = 15;
  static EdgeInsets inputMargins =
      EdgeInsets.only(top: INPUT_Y_MARGIN, bottom: INPUT_Y_MARGIN);
  static const double Y_MARGIN = 8;
  static EdgeInsets yMarginInsets =
      EdgeInsets.only(top: Y_MARGIN, bottom: Y_MARGIN);

  static const double card_image_size = 120;
  static const double card_store_image_size = 160;

  // Styling tombol Utama
  static ButtonStyle primeButton({Color primaryColor = Colors.white}) {
    return ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 30),
        primary: primaryColor,
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)));
  }

  static InputDecoration textInput({String hint = ""}) {
    return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Color(0xFFFF3200),
            )),
        hintText: hint);
  }

  /// Tema utama Aplikasi
  static ThemeData baseTheme() {
    return ThemeData(
      primarySwatch: Colors.deepOrange,
      backgroundColor: BaseTheme.bg_color,
      textTheme: TextTheme(
        button: TextStyle(
            fontFamily: BaseTheme.font_family, fontSize: BaseTheme.font_size),
        headline1: TextStyle(fontFamily: BaseTheme.font_family),
        headline3: TextStyle(fontFamily: BaseTheme.font_family),
        headline4:
            TextStyle(fontFamily: BaseTheme.font_family, color: Colors.black),
        // Heading Theme
        headline5: TextStyle(
          fontFamily: BaseTheme.font_family,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        headline6:
            TextStyle(fontFamily: BaseTheme.font_family, color: Colors.black),
        bodyText1: TextStyle(
          fontFamily: BaseTheme.font_family,
          // fontSize: BaseTheme.font_size
        ),
        bodyText2: TextStyle(
            fontFamily: BaseTheme.font_family,
            fontSize: BaseTheme.font_size,
            color: Colors.grey[600]),
        subtitle1: TextStyle(
          fontFamily: BaseTheme.font_family,
          // fontSize: 20,
        ),
        subtitle2: TextStyle(
          fontFamily: BaseTheme.font_family,
        ),
        caption: TextStyle(
          fontFamily: BaseTheme.font_family,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
          contentTextStyle: TextStyle(
              fontFamily: BaseTheme.font_family,
              fontSize: BaseTheme.font_size)),
    );
  }
}
