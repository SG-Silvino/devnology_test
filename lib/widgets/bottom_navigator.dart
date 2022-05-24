import 'package:devnology_test/config/navigation.dart';
import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/widgets/cart_badge_wdgt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

RxInt selectedNavIndex = 0.obs;

// ignore: must_be_immutable
class MyBottomNav extends StatelessWidget {
  MyBottomNav({Key? key}) : super(key: key);

  List navRoutes = [
    '/home',
    '/search',
    '/cart',
    '/profile',
    '/more',
  ];

  String iconPath = "assets/icons/";

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      selectedNavIndex.value = index;

      Nav.goAndReplacePageNamed(navRoutes[index]);
    }

    Color _itemIsSelected(int index) {
      if (index == selectedNavIndex.value) {
        return AppTheme.secondaryColor;
      } else {
        return AppTheme.iconLight;
      }
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppTheme.primaryColor,
      unselectedItemColor: AppTheme.letterWhite,
      selectedItemColor: AppTheme.secondaryColor,
      currentIndex: selectedNavIndex.value,
      onTap: _onItemTapped,
      iconSize: 18,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconPath + 'home.svg',
            color: _itemIsSelected(0),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(iconPath + 'search.svg',
              color: _itemIsSelected(1)),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: CartIconBadge(-8, color: _itemIsSelected(2)),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconPath + 'person.svg',
            color: _itemIsSelected(3),
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconPath + 'more.svg',
            color: _itemIsSelected(4),
          ),
          label: 'More',
        ),
      ],
    );
  }
}
