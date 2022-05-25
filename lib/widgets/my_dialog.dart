import 'dart:io';

import 'package:devnology_test/config/navigation.dart';
import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/widgets/bottom_navigator.dart';
import 'package:devnology_test/widgets/my_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyDialog {
  static showSnackBarText({required String title, required String msg}) {
    Get.snackbar(title, msg,
        backgroundColor: AppTheme.primaryColor,
        colorText: AppTheme.letterWhite,
        animationDuration: const Duration(milliseconds: 350),
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        margin: const EdgeInsets.all(10));
  }

  static showConfirmDialog({
    required BuildContext context,
    String? title = "Confirm",
    Widget? content,
    required void Function()? onConfirm,
    void Function()? onCancel,
    String? confirmText = "Yes",
    String? cancelText = "No",
    Color? confirmBtnColor,
    Color? cancelBtnColor,
    Color? confirmTxtColor,
    Color? cancelTxtColor,
    bool? barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "$title",
            style: AppTheme.textStyleParagraph(
                fontWeight: FontWeight.w700, fontSize: 18),
          ),
          content: content,
          actions: <Widget>[
            MyBtn.txtBtn(
              label: cancelText,
              backgroundColor: cancelBtnColor,
              onPressed: onCancel,
            ),
            MyBtn.txtBtn(
              label: confirmText,
              backgroundColor: confirmBtnColor,
              onPressed: onConfirm,
            ),
          ],
        );
      },
    );
  }

  static showExitToApp() async {
    if (Get.currentRoute != "/home") {
      Nav.goAndReplacePageNamed('home');
      selectedNavIndex.value = 0;

      return false;
    } else {
      return await MyDialog.showConfirmDialog(
        context: Get.context!,
        title: "Exit to app",
        content: Text(
          'Are you sure you want to close app?',
          style: AppTheme.textStyleParagraph(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        cancelBtnColor: AppTheme.primaryColor,
        confirmBtnColor: Colors.red,
        onCancel: () => Nav.goBack(),
        onConfirm: () {
          Future.delayed(const Duration(milliseconds: 500), () {
            if (!Platform.isAndroid) {
              exit(0);
            } else {
              SystemNavigator.pop();
            }
          });
        },
      );
    }
  }
}
