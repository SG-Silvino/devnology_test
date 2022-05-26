import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:devnology_test/widgets/my_dialog.dart';
import 'package:get/route_manager.dart';

listenInternetConnection() {
  bool? firstTime = true;

  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    if (result != ConnectivityResult.mobile &&
        result != ConnectivityResult.wifi &&
        result != ConnectivityResult.ethernet) {
      firstTime = false;

      MyDialog.showSnackBarText(
        title: "Internet connection",
        msg: "No internet connection",
        snackPosition: SnackPosition.TOP,
      );
    } else {
      if (!firstTime!) {
        MyDialog.showSnackBarText(
          title: "Internet connection",
          msg: "Internet connection restored",
          snackPosition: SnackPosition.TOP,
        );
      }
    }
  });
}
