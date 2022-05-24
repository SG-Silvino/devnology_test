import 'package:devnology_test/config/supabase_config.dart';
import 'package:devnology_test/main.dart';
import 'package:devnology_test/model/product.dart';

class MyCart {
  int? productQtd;
  Product? product;

  MyCart({
    this.product,
    this.productQtd,
  });

  factory MyCart.fromMap(Map<String, dynamic> map) {
    return MyCart(
      product: Product.fromMap(map['product_id']),
      productQtd: map['product_qtd'],
    );
  }

  Future getCarts() async {
    await supabase
        .from('Cart')
        .select('''product_qtd, product_id (*)''')
        .execute()
        .then((value) {
          cartList = value.data as List;

          for (var product in cartList) {
            MyCart cart = MyCart.fromMap(product);

            double price =
                double.parse(cart.product!.price!.toStringAsFixed(2));

            cartListPriceTotal += (price * cart.productQtd!);
          }
        });

    cartBadge = cartList.length;
  }
}
