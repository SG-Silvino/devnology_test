import 'package:devnology_test/config/navigation.dart';
import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/main.dart';
import 'package:devnology_test/model/cart.dart';
import 'package:devnology_test/widgets/appbar.dart';
import 'package:devnology_test/widgets/bottom_navigator.dart';
import 'package:devnology_test/widgets/cart_item.dart';
import 'package:devnology_test/widgets/my_btn.dart';
import 'package:devnology_test/widgets/my_progress_indicator.dart';
import 'package:devnology_test/widgets/price_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool loading = false;

  @override
  void initState() {
    super.initState();

    setState(() => loading = true);

    MyCart().getCarts().whenComplete(() {
      setState(() {
        cartListPriceTotal;
        loading = false;
      });
    });
  }

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
      body: loading
          ? customProgress()
          : cartList.isEmpty
              ? Center(
                  child: Text(
                  "Nenhum item adicionado ao carinho",
                  style:
                      AppTheme.textStyleParagraph(fontWeight: FontWeight.w700),
                ))
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    MyCart cart = MyCart.fromMap(cartList[index]);

                    return CartItem(cart: cart);
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    cartListPriceTotal,
                    style: AppTheme.textStyleParagraph(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: AppTheme.letterWhite,
                    ),
                  ),
                ],
              ),
              MyBtn.roundedBtnWithIcon(
                label: "Checkout",
                iconData: Icons.arrow_forward_ios_outlined,
                backgroundColor: AppTheme.primaryColor,
                onPressed: () => Nav.gotoPageNamed('checkout'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNav(),
    );
  }
}
