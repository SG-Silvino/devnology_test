import 'package:devnology_test/view/cart_page.dart';
import 'package:devnology_test/view/checkout_page.dart';
import 'package:devnology_test/view/coming_soon_page.dart';
import 'package:devnology_test/view/home_page.dart';
import 'package:devnology_test/view/splash_screen_page.dart';
import 'package:get/get.dart';

Transition fadeIn = Transition.fadeIn;
Transition rTl = Transition.rightToLeft;

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => const SplashScreenPage(), transition: fadeIn),
  GetPage(name: '/home', page: () => const HomePage(), transition: fadeIn),
  GetPage(name: '/cart', page: () => const CartPage(), transition: fadeIn),
  GetPage(name: '/checkout', page: () => const CheckoutPage(), transition: rTl),
  GetPage(
      name: '/comingSoon',
      page: () => const ComingSoonPage(),
      transition: fadeIn),
];
