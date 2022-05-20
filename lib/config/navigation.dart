import 'package:flutter/material.dart';

class Nav {
  static gotoPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static goAndReplacePage(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static gotoPageNamed(BuildContext context, String routeName) {
    if (!routeName.contains('/')) {
      routeName = '/' + routeName;
    }

    Navigator.pushNamed(context, routeName);
  }

  static goAndReplacePageNamed(BuildContext context, String routeName) {
    if (!routeName.contains('/')) {
      routeName = '/' + routeName;
    }

    Navigator.pushReplacementNamed(context, routeName);
  }

  static goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
