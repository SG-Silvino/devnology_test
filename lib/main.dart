import 'package:devnology_test/config/connectivity.dart';
import 'package:devnology_test/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxInt cartBadge = 0.obs; //qtd of different products in cart
RxDouble cartListPriceTotal = 0.0.obs; //total price of products in cart

List bannerList = [];
List categoryList = [];
List productList = [];
List cartList = [];

String? userID;

//Datetime to decide if should do new request since last time it was made
DateTime? lastFetchHomeDatetime;
DateTime? newFetchHomeDatetime;

DateTime? lastFetchCartDatetime;
DateTime? newFetchCartDatetime;
//for check if user made changes on cart
bool? shouldFetchCart = false;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  listenInternetConnection();

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
