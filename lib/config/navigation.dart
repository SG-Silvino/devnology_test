import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nav {
  static gotoPage(page) {
    Get.to(page);
  }

  static goAndReplacePage(Widget page) {
    Get.off(() => page);
  }

  static gotoPageNamed(String routeName) {
    if (!routeName.contains('/')) {
      routeName = '/' + routeName;
    }

    Get.toNamed(routeName);
  }

  static goAndReplacePageNamed(String routeName) {
    if (!routeName.contains('/')) {
      routeName = '/' + routeName;
    }

    Get.offAllNamed(routeName);
  }

  static goBack() {
    Get.back();
  }
}
