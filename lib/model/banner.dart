import 'package:devnology_test/config/supabase_config.dart';

class Banner {
  String? id;
  List? banners;

  Banner({
    this.id,
    this.banners,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'banners': banners,
    };
  }

  factory Banner.fromMap(Map<String, dynamic> map) {
    return Banner(
      id: map['id'],
      banners: map['banners']
    );
  }

  Future getdata() async {
    var response = await supabase.from('Banner').select().execute();

    return response.data;
  }
}
