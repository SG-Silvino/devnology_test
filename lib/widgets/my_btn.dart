import 'package:flutter/material.dart';

class MyBtn {
  static roundedBtnWithIcon({
    required String? label,
    required IconData? iconData,
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
                color: foregroundColor,
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),
            ),
            Icon(iconData, color: foregroundColor)
          ],
        ),
      ),
    );
  }
}
