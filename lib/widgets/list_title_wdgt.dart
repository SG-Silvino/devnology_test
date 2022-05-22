import 'package:devnology_test/config/theme.dart';
import 'package:flutter/material.dart';

Widget listTitle(String label, Widget child) {
  return Column(
    children: [
      Container(
          margin: const EdgeInsets.only(top: 20, left: 20, bottom: 12),
          child: Row(children: [
            Text(
              label,
              style: AppTheme.textStyleH1,
            )
          ])),
      child,
    ],
  );
}
