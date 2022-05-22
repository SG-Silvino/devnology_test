import 'package:devnology_test/config/supabase_config.dart';
import 'package:devnology_test/main.dart';

class MyCart {
  String? cover;

  MyCart({
    this.cover,
  });

  factory MyCart.fromMap(Map<String, dynamic> map) {
    return MyCart(
      cover: map['cover'],
    );
  }

  Future getCarts() async {
    await supabase
        .from("Cart")
        .select()
        .eq('user_id', 'ue')
        .execute()
        .then((value) async {
      cartProductIds = value.data as List;
      cartProductIds = cartProductIds[0]['product_ids'];

      var response = await supabase
          .from("Product")
          .select()
          .in_('id', cartProductIds)
          .order('last_update', ascending: true)
          .execute();

      cartProductList = response.data as List;
    });
  }
}
