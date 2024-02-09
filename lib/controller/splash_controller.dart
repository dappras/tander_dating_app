import 'dart:async';
import 'package:dating_app_clone/routes/route_name.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    var duration = const Duration(seconds: 3);
    Timer(duration, () {
      Get.offAllNamed(RouteName.welcomePage);
    });
    super.onInit();
  }
}
