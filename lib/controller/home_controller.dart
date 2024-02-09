import 'dart:developer';
import 'package:dating_app_clone/components/http_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var http = HttpService();
  var storage = GetStorage();
  var listUser = [].obs;

  @override
  void onInit() {
    getRandomUser();
    super.onInit();
  }

  void getRandomUser() async {
    await http.get('api/').then((res) {
      if (res['results'].length > 0) {
        listUser.value = res['results'];
      }
    }).catchError((e) {
      log("Error getting data user");
      print(e);
    });
  }

  void eventLike() {
    var listUserStorage = storage.read('listUser') ?? [];
    listUserStorage.add(listUser.isNotEmpty ? listUser[0] : {});
    storage.write('listUser', listUserStorage);
    getRandomUser();
  }

  void eventDislike() {
    getRandomUser();
  }
}
