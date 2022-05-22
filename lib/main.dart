import 'package:devnology_test/config/routes.dart';
import 'package:flutter/material.dart';

int cart = 0;

List bannerList = [];
List categoryList = [];
List productList = [];
List cartProductIds = [];
List cartProductList = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Devnology',
      initialRoute: '/',
      routes: routes,
    );
  }
}
