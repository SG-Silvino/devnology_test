import 'package:devnology_test/config/supabase_config.dart';
import 'package:devnology_test/main.dart';

class Product {
  String? id;
  String? name;
  String? details;
  List? imgUrl;
  double? price;

  Product({
    this.id,
    this.name,
    this.imgUrl,
    this.price,
    this.details,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      details: map['details'],
      imgUrl: map['imgUrl'],
      price: map['price'].toDouble(),
    );
  }

  Future getProducts() async {
    var response = await supabase
        .from("Product")
        .select()
        .order('last_update', ascending: true)
        .execute();

    productList = response.data as List;
  }
}
