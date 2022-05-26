import 'dart:async';
import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/main.dart';
import 'package:devnology_test/model/cart.dart';
import 'package:devnology_test/widgets/my_img.dart';
import 'package:devnology_test/widgets/price_format.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  MyCart? cart;

  CartItem({required this.cart, Key? key}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  cartBtn({
    required String? label,
    required double? size,
    void Function()? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(size!)),
        width: size,
        height: size,
        alignment: Alignment.center,
        child: Text(
          "$label",
          style: AppTheme.textStyleParagraph(
            fontSize: 12,
            color: AppTheme.letterWhite,
          ),
        ),
      ),
    );
  }

  handleItemQtd({required bool increment}) {
    int qtd = widget.cart!.productQtd!;

    if (!increment && qtd == 1) {
      //if try decrementing and qtd is 1, do nothing
      qtd = 1;
    } else {
      double price =
          double.parse(widget.cart!.product!.price!.toStringAsFixed(2));

      //increment or decrement qtd of product
      //and recalculate total price
      if (increment) {
        widget.cart!.productQtd = ++qtd;
        cartListPriceTotal.value += price;
      } else {
        widget.cart!.productQtd = --qtd;
        cartListPriceTotal.value -= price;
      }

      productQtdChanged = true;

      //Cancel timer if it's not null
      //to interrupt the task that was scheduled
      if (timer != null) {
        timer!.cancel();
      }

      //scheduling task: update product qtd in BD
      timer = Timer(const Duration(seconds: 3), () async {
        //if user made changes on qtd, update it in BD
        if (initialQtd != qtd) {
          await widget.cart!.updateCartProductQtd(widget.cart!, qtd);
        }

        timer = null; //destroy the timer

        //initialQtd is the qtd of product after save in BD
        //and set productQtd is not changed again
        initialQtd = qtd;
        productQtdChanged = false;
      });
    }
  }

  Timer? timer;

  bool productQtdChanged = false; //to check if user made changes on cart
  int? initialQtd; //to save initial qtd of product

  @override
  void initState() {
    initialQtd = widget.cart!.productQtd;

    super.initState();
  }

  @override
  void dispose() {
    //on exit to page, cancel schedule (timer) if is active
    //and fetch data immediately
    if (timer != null) {
      timer!.cancel(); //unschedule the task: update product qtd in BD

      //send product qtd to BD if qtd was changed
      if (productQtdChanged) {
        widget.cart!
            .updateCartProductQtd(widget.cart!, widget.cart!.productQtd!);
      }
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 25, right: 25, top: 24, bottom: 20),
        child: Row(
          children: [
            MyImg.imgURL(
              url: widget.cart!.product!.imgUrl![0],
              key: Key(widget.cart!.product!.id!),
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(right: 22),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.cart!.product!.name}",
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                    style: AppTheme.textStyleParagraph(
                      fontSize: 11,
                      color: AppTheme.letterblack,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: priceFormat(
                      widget.cart!.product!.price!,
                      style: AppTheme.textStyleParagraph(
                        fontWeight: FontWeight.w700,
                        color: AppTheme.letterblack,
                      ),
                    ),
                  ),
                  widget.cart!.product!.enabled!
                      ? Row(
                          children: [
                            cartBtn(
                                label: "-",
                                size: 14,
                                onPressed: () {
                                  setState(() {
                                    handleItemQtd(increment: false);
                                  });
                                }),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 7),
                              child: Text(
                                "${widget.cart!.productQtd}",
                                style: AppTheme.textStyleParagraph(
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.letterblack,
                                ),
                              ),
                            ),
                            cartBtn(
                                label: "+",
                                size: 15,
                                onPressed: () {
                                  setState(() {
                                    handleItemQtd(increment: true);
                                  });
                                }),
                          ],
                        )
                      : Text(
                          "Out of stock",
                          style: AppTheme.textStyleParagraph(
                            fontWeight: FontWeight.w700,
                            color: Colors.red,
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
