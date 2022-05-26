import 'package:devnology_test/config/supabase_config.dart';
import 'package:devnology_test/main.dart';

class Category {
  String? label, image;
  int? id;

  Category({
    this.id,
    this.label,
    this.image,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      label: map['label'],
      image: map['image'],
    );
  }

  Future getCategories() async {
    var response = await supabase
        .from("Category")
        .select()
        .eq('enabled', true)
        .order('id', ascending: true)
        .execute();

    categoryList = response.data as List;
  }
}
