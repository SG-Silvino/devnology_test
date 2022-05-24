import 'package:badges/badges.dart';
import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CartIconBadge extends StatelessWidget {
  double? bottomAlign;
  Color? color;

  CartIconBadge(this.bottomAlign, {this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Badge(
        toAnimate: true,
        shape: BadgeShape.circle,
        badgeColor: AppTheme.secondaryColor,
        badgeContent: Container(
          padding: EdgeInsets.all(cartBadge > 9 ? 2 : 4),
          child: Text(
            cartBadge > 9 ? "9+" : "$cartBadge",
            style: TextStyle(
              fontSize: cartBadge > 9 ? 10 : 12,
              color: AppTheme.letterWhite,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
        padding: const EdgeInsets.all(0),
        position: BadgePosition.bottomEnd(
            bottom: cartBadge > 9 ? bottomAlign! + 2 : bottomAlign!),
        animationType: BadgeAnimationType.fade,
        child: SvgPicture.asset(
          'assets/icons/cart.svg',
          color: color ?? AppTheme.iconLight,
        ),
      ),
    );
  }
}
