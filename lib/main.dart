import 'package:devnology_test/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxInt cartBadge = 0.obs;
RxDouble cartListPriceTotal = 0.0.obs;

List bannerList = [];
List categoryList = [];
List productList = [];
List cartList = [];

String? userID;

DateTime? lastFetchHomeData;
DateTime? newFetchHomeData;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Devnology',
      initialRoute: '/',
      getPages: routes,
    );
  }
}
