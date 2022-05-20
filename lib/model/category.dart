import 'package:devnology_test/config/supabase_config.dart';

class Category {
  String? id;
  List? categories;

  Category({
    this.id,
    this.categories,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categories': categories,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      categories: map['categories'],
    );
  }

  Future getdata() async {
    var response = await supabase.from('Category').select().execute();

    return response.data;
  }
}
