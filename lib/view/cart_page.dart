import 'package:devnology_test/config/navigation.dart';
import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/main.dart';
import 'package:devnology_test/model/cart.dart';
import 'package:devnology_test/widgets/appbar.dart';
import 'package:devnology_test/widgets/bottom_navigator.dart';
import 'package:devnology_test/widgets/cart_item.dart';
import 'package:devnology_test/widgets/list_wdgt.dart';
import 'package:devnology_test/widgets/my_btn.dart';
import 'package:devnology_test/widgets/my_progress_indicator.dart';
import 'package:devnology_test/widgets/my_dialog.dart';
import 'package:devnology_test/widgets/price_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// ignore: must_be_immutable
class CartPage extends StatefulWidget {
  bool? canPop = false;

  CartPage({this.canPop, Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool loading = false;

  bool showDismissBG = true;

  @override
  void initState() {
    super.initState();

    setState(() => loading = true);

    MyCart().getCarts().then((value) {
      cartListPriceTotal.value;

      setState(() => loading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => widget.canPop! ? true : MyDialog.showExitToApp(),
      child: Scaffold(
        backgroundColor: AppTheme.bgLight,
        appBar: myAppBar(
          context,
          centerTitle: widget.canPop! ? true : false,
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
                    style: AppTheme.textStyleParagraph(
                        fontWeight: FontWeight.w700),
                  ))
                : MyList.vertical(
                    label: "Cart",
                    padding: const EdgeInsets.only(bottom: 100),
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      MyCart cart = MyCart.fromMap(cartList[index]);

                      return Dismissible(
                        child: CartItem(cart: cart),
                        key: Key(cart.id!),
                        direction: DismissDirection.endToStart,
                        background: showDismissBG
                            ? Container(
                                color: Colors.red,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Icon(Icons.delete, color: Colors.white)
                                    ],
                                  ),
                                ),
                              )
                            : null,
                        confirmDismiss: (DismissDirection direction) async {
                          setState(() => showDismissBG = false);

                          return await MyDialog.showConfirmDialog(
                            context: context,
                            title: "Delete item",
                            content: Text(
                              "Are you sure you want to delete this item?",
                              style: AppTheme.textStyleParagraph(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            cancelBtnColor: AppTheme.primaryColor,
                            confirmBtnColor: Colors.red,
                            onCancel: () {
                              setState(() => showDismissBG = true);

                              Nav.goBack();
                            },
                            onConfirm: () async {
                              setState(() {
                                showDismissBG = true;
                                cartList.removeAt(index);
                              });

                              Nav.goBack();

                              cartBadge.value--;

                              //recalculate price total on remove item
                              double price = double.parse(
                                  cart.product!.price!.toStringAsFixed(2));

                              cartListPriceTotal.value -=
                                  price * cart.productQtd!;

                              await cart.deleteFromCart(cart);
                            },
                          );
                        },
                      );
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
                    loading
                        ? priceFormat(
                            0,
                            style: AppTheme.textStyleParagraph(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: AppTheme.letterWhite,
                            ),
                          )
                        : Obx(
                            () => priceFormat(
                              cartListPriceTotal.value,
                              style: AppTheme.textStyleParagraph(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppTheme.letterWhite,
                              ),
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
      ),
    );
  }
}
