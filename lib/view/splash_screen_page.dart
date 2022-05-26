import 'package:devnology_test/config/navigation.dart';
import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/model/banner.dart';
import 'package:devnology_test/model/cart.dart';
import 'package:devnology_test/model/category.dart';
import 'package:devnology_test/model/product.dart';
import 'package:devnology_test/model/user.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  MyBanner myBanner = MyBanner();
  Category category = Category();
  Product product = Product();
  MyCart myCart = MyCart();
  User user = User();

  @override
  void initState() {
    User().handleUser().then((value) {
      Future.wait([
        MyBanner().getBanners(),
        Category().getCategories(),
        Product().getProducts(),
        MyCart().getCarts(),
      ]).whenComplete(() => Nav.goAndReplacePageNamed('home'));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Center(
        child: Image.asset("assets/images/Logo.png"),
      ),
    );
  }
}
