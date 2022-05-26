import 'package:devnology_test/config/supabase_config.dart';
import 'package:devnology_test/main.dart';

class MyBanner {
  int? id;
  String? image;

  MyBanner({
    this.id,
    this.image,
  });

  factory MyBanner.fromMap(Map<String, dynamic> map) {
    return MyBanner(
      id: map['id'],
      image: map['image'],
    );
  }

  Future getBanners() async {
    var response = await supabase
        .from("Banner")
        .select()
        .eq('enabled', true)
        .order('id', ascending: true)
        .execute();

    bannerList = response.data as List;
  }
}
