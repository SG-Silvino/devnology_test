import 'package:devnology_test/config/supabase_config.dart';
import 'package:devnology_test/main.dart';

class Product {
  String? id;
  String? name;
  String? details;
  List? imgUrl;
  double? price;
  bool? enabled;

  Product({
    this.id,
    this.name,
    this.imgUrl,
    this.price,
    this.details,
    this.enabled,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      details: map['details'],
      imgUrl: map['imgUrl'],
      price: map['price'].toDouble(),
      enabled: map['enabled'],
    );
  }

  Future getProducts() async {
    var response = await supabase
        .from("Product")
        .select()
        .eq('enabled', true)
        .order('last_update', ascending: true)
        .execute();

    productList = response.data as List;
  }
}
