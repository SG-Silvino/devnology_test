import 'package:devnology_test/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackBar {
  static showSnackBar({required String title, required String msg}) {
    Get.snackbar(
      title,
      msg,
      backgroundColor: AppTheme.primaryColor,
      colorText: AppTheme.letterWhite,
      animationDuration: const Duration(milliseconds: 350),
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      margin: const EdgeInsets.all(10)
    );
  }
}
