import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: 180,
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
            "https://fufradmroykcnbfxvqqg.supabase.co/storage/v1/object/public/images/Banners/banner_1 1.png"),
      )),
    );
  }
}