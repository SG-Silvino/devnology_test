import 'package:devnology_test/config/supabase_config.dart';
import 'package:devnology_test/main.dart';

class MyBanner {
  String? cover;

  MyBanner({
    this.cover,
  });

  factory MyBanner.fromMap(Map<String, dynamic> map) {
    return MyBanner(
      cover: map['cover'],
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
