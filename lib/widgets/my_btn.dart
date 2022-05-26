import 'package:devnology_test/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      width: Get.width > 360 ? 140 : 125,
      height: customIcon != null ? 38 : 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 18, right: 12),
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
                fontSize: Get.width > 360 ? 12 : 10,
                fontWeight: FontWeight.w900,
              ),
            ),
            customIcon != null
                ? SizedBox(height: Get.width > 360 ? 18 : 16, child: customIcon)
                : Icon(
                    iconData,
                    color: foregroundColor,
                    size: Get.width > 360 ? 18 : 16,
                  ),
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
