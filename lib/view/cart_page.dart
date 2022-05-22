import 'package:devnology_test/config/navigation.dart';
import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/main.dart';
import 'package:devnology_test/model/product.dart';
import 'package:devnology_test/widgets/appbar.dart';
import 'package:devnology_test/widgets/bottom_navigator.dart';
import 'package:devnology_test/widgets/cart_item.dart';
import 'package:devnology_test/widgets/my_btn.dart';
import 'package:devnology_test/widgets/price_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgLight,
      appBar: myAppBar(
        context,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/icons/chat.svg',
                  color: AppTheme.iconLight,
                ),
                const SizedBox(width: 20),
                SvgPicture.asset(
                  'assets/icons/notification.svg',
                  color: AppTheme.iconLight,
                ),
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: cartProductList.length,
        itemBuilder: (context, index) {
          if (index == 0) total = 0;

          Product product = Product.fromMap(productList[index]);

          double price = double.parse(product.price!.toStringAsFixed(2));

          total = price + total;

          return CartItem(product: product);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        height: 86,
        color: AppTheme.thirdColor,
        margin: const EdgeInsets.only(bottom: 55),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 110,
                    child: Text(
                      "Total",
                      style: AppTheme.textStyleParagraph(
                        color: AppTheme.letterWhite,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  priceFormat(
                    total,
                    style: AppTheme.textStyleParagraph(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: AppTheme.letterWhite,
                    ),
                  )
                ],
              ),
              MyBtn.roundedBtnWithIcon(
                label: "Checkout",
                iconData: Icons.arrow_forward_ios_outlined,
                backgroundColor: AppTheme.primaryColor,
                onPressed: () => Nav.gotoPageNamed(context, 'checkout'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNav(),
    );
  }
}
