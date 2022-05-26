import 'package:devnology_test/config/theme.dart';
import 'package:flutter/material.dart';

class MyList {
  static Widget horizontal({
    String? label,
    int flex = 1,
    int? itemCount,
    required Widget Function(BuildContext, int) itemBuilder,
    required double height,
  }) {
    return SizedBox(
      height: height,
      child: Column(
        children: [
          if (label != null)
            Container(
                margin: const EdgeInsets.only(top: 20, left: 20, bottom: 12),
                child: Row(children: [
                  Text(
                    label,
                    style: AppTheme.textStyleH1,
                  )
                ])),
          Expanded(
            flex: flex,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: itemCount,
              itemBuilder: itemBuilder,
            ),
          ),
        ],
      ),
    );
  }

  static vertical({
    String? label,
    int? itemCount,
    required Widget Function(BuildContext, int) itemBuilder,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 20),
  }) {
    return Column(
      children: [
        if (label != null)
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20, bottom: 12),
            child: Row(children: [
              Text(
                label,
                style: AppTheme.textStyleH1,
              )
            ]),
          ),
        Expanded(
            child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          padding: padding,
          itemBuilder: itemBuilder,
          itemCount: itemCount,
        )),
      ],
    );
  }
}
