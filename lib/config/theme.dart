import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0xff2E3746);
  static Color secondaryColor = const Color(0xffFFC600);
  static Color thirdColor = const Color(0xff5A6476);

  static Color bgLight = Colors.white;
  static Color bgGrey = const Color(0xfff0f0f0);

  static Color letterWhite = Colors.white;
  static Color letterblack = Colors.black;
  static Color titleColor = const Color(0xff2E3746);
  static Color subTitleColor = Colors.black;

  static Color iconLight = Colors.white;

  static TextStyle textStyleH1 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: primaryColor,
  );

  static TextStyle textStyleParagraph({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? primaryColor,
      );
}
