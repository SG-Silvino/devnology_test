import 'package:devnology_test/config/navigation.dart';
import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/widgets/cart_badge_wdgt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class MyBottomNav extends StatelessWidget {
  MyBottomNav({Key? key}) : super(key: key);

  List navRoutes = [
    '/home',
    '/comingSoon',
    '/cart',
    '/comingSoon',
    '/comingSoon',
  ];

  int _selectedIndex = 0;

  String iconPath = "assets/icons/";

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      _selectedIndex = index;

      Nav.goAndReplacePageNamed(context, navRoutes[index]);
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppTheme.primaryColor,
      unselectedItemColor: AppTheme.letterWhite,
      iconSize: 18,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(iconPath + 'home.svg'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(iconPath + 'search.svg'),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: CartIconBadge(-8),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(iconPath + 'person.svg'),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(iconPath + 'more.svg'),
          label: 'More',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: AppTheme.secondaryColor,
      onTap: _onItemTapped,
    );
  }
}
