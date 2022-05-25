import 'package:devnology_test/config/theme.dart';
import 'package:flutter/material.dart';

class MyBtn {
  static roundedBtnWithIcon({
    required String? label,
    IconData? iconData,
    Widget? customIcon,
    Color? foregroundColor,
    Color? backgroundColor,
    required void Function()? onPressed,
  }) {
    return SizedBox(
      width: 140,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 16, right: 8),
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$label".toUpperCase(),
              style: TextStyle(
                color: foregroundColor ?? AppTheme.letterWhite,
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),
            ),
            customIcon ?? Icon(iconData, color: foregroundColor)
          ],
        ),
      ),
    );
  }

  static Widget txtBtn({
    required void Function()? onPressed,
    required String? label,
    Color? color,
    Color? backgroundColor,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        "$label",
        style: AppTheme.textStyleParagraph(
          fontWeight: FontWeight.w700,
          color: color ?? AppTheme.letterWhite,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? AppTheme.primaryColor,
      ),
    );
  }
}
