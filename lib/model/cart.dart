import 'package:devnology_test/config/supabase_config.dart';
import 'package:devnology_test/main.dart';
import 'package:devnology_test/model/product.dart';
import 'package:flutter/material.dart';

class MyCart {
  String? id;
  int? productQtd;
  Product? product;

  MyCart({
    this.id,
    this.product,
    this.productQtd,
  });

  factory MyCart.fromMap(Map<String, dynamic> map) {
    return MyCart(
      id: map['id'],
      product: Product.fromMap(map['product_id']),
      productQtd: map['product_qtd'],
    );
  }

  Future getCarts() async {
    shouldFetchCart = false;

    await supabase
        .from('Cart')
        .select('''id, product_qtd, product_id (*)''')
        .eq('user_id', userID)
        .order('last_update', ascending: false)
        .execute()
        .then((value) {
          cartList = value.data as List;
          cartListPriceTotal.value = 0;

          for (var product in cartList) {
            MyCart cart = MyCart.fromMap(product);

            if (cart.product!.enabled!) {
              double price =
                  double.parse(cart.product!.price!.toStringAsFixed(2));

              cartListPriceTotal.value += price * cart.productQtd!;
            }
          }
        });

    cartBadge.value = cartList.length;
  }

  Future addToCart(BuildContext context, Product product) async {
    shouldFetchCart = true;

    Future addNewProductToCart() async {
      await supabase
          .from("Cart")
          .insert({
            "user_id": userID,
            "product_id": product.id,
          })
          .execute()
          .then((value) => ++cartBadge.value);
    }

    if (cartList.isNotEmpty) {
      bool productExistsInCart = false;

      for (var i = 0; i < cartList.length; i++) {
        MyCart cart = MyCart.fromMap(cartList[i]);

        if (cart.product!.id == product.id) {
          productExistsInCart = true;

          int qtd = cart.productQtd! + 1;

          await updateCartProductQtd(cart, qtd);
        }
      }

      if (!productExistsInCart) {
        await addNewProductToCart();
      }
    } else {
      await addNewProductToCart();
    }
  }

  Future updateCartProductQtd(MyCart cart, int qtd) async {
    shouldFetchCart = true;

    await supabase
        .from("Cart")
        .update({"product_qtd": qtd})
        .eq('id', cart.id)
        .execute();
  }

  Future deleteFromCart(MyCart cart) async {
    shouldFetchCart = true;

    await supabase.from("Cart").delete().eq('id', cart.id).execute();
  }
}
