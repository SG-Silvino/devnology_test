import 'package:devnology_test/config/theme.dart';
import 'package:flutter/material.dart';

class MyList {
  static Widget body(
      {int? flex = 1,
      required Widget Function(BuildContext, int) itemBuilder,
      int? itemCount,
      Axis scrollDirection = Axis.horizontal}) {
    return Expanded(
      flex: flex!,
      child: ListView.builder(
        scrollDirection: scrollDirection,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }

  static Widget header(String label, Widget child) {
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
}
