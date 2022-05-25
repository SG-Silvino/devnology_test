import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/widgets/my_btn.dart';
import 'package:flutter/material.dart';
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
}
