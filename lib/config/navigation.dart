import 'package:flutter/material.dart';

gotoPage(BuildContext context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
