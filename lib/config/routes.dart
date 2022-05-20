import 'package:devnology_test/view/cart_page.dart';
import 'package:devnology_test/view/checkout_page.dart';
import 'package:devnology_test/view/coming_soon_page.dart';
import 'package:devnology_test/view/home_page.dart';
import 'package:devnology_test/view/product_details_page.dart';
import 'package:devnology_test/view/splash_screen_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const SplashScreenPage(),
  '/home': (context) => const HomePage(),
  '/product': (context) => const ProductDetailsPage(),
  '/cart': (context) => const CartPage(),
  '/checkout': (context) => const CheckoutPage(),
  '/comingSoon': (context) => const ComingSoonPage(),
};
