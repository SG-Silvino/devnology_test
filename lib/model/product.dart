import 'package:devnology_test/config/supabase_config.dart';

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'details': details,
      'imgUrl': imgUrl,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      details: map['details'],
      imgUrl: map['imgUrl'],
      price: map['price'],
    );
  }

  Future getdata() async {
    var response = await supabase.from('Product').select().execute();

    return response.data;
  }
}
