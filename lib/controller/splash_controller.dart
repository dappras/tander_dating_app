import 'dart:async';
import 'package:dating_app_clone/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  var storage = GetStorage();

  @override
  void onInit() {
    var duration = const Duration(seconds: 3);
    Timer(duration, () {
      if (storage.read('user') != null) {
        Get.offAllNamed(RouteName.homePage);
      } else {
        Get.offAllNamed(RouteName.welcomePage);
      }
    });
    super.onInit();
  }
}
