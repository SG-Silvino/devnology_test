import 'package:badges/badges.dart';
import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CartIconBadge extends StatelessWidget {
  double? bottomAlign;

  CartIconBadge(this.bottomAlign, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      toAnimate: true,
      shape: BadgeShape.circle,
      badgeColor: AppTheme.secondaryColor,
      badgeContent: Container(
        padding: EdgeInsets.all(cart > 9 ? 2 : 4),
        child: Text(
          cart > 9 ? "9+" : "$cart",
          style: TextStyle(
            fontSize: cart > 9 ? 10 : 12,
            color: AppTheme.letterWhite,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
      elevation: 0,
      padding: const EdgeInsets.all(0),
      position: BadgePosition.bottomEnd(bottom: cart > 9 ? bottomAlign! + 2 : bottomAlign!),
      animationType: BadgeAnimationType.fade,
      child: SvgPicture.asset('assets/icons/cart.svg'),
    );
  }
}
