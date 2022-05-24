import 'package:devnology_test/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class User {
  Future handleUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('user_id')) {
      userID = prefs.getString('user_id');
    } else {
      userID = const Uuid().v4();

      prefs.setString('user_id', userID!);
    }
  }
}
