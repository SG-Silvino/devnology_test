import 'package:devnology_test/config/supabase_config.dart';
import 'package:devnology_test/main.dart';

class Category {
  String? label, cover;

  Category({
    this.label,
    this.cover,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      label: map['label'],
      cover: map['cover'],
    );
  }

  Future getCategories() async {
    var response =
        await supabase.from("Category").select().eq('id', 1).execute();

    categoryList = response.data as List;
  }
}
