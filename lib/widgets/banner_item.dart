import 'package:devnology_test/model/banner.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BannerItem extends StatelessWidget {
  MyBanner? banner;

  BannerItem({required this.banner, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 325,
        height: 180,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(banner!.cover!),
          ),
        ),
      ),
    );
  }
}
