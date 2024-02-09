import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LikesController extends GetxController {
  var storage = GetStorage();
  var listUser = [].obs;

  @override
  void onInit() {
    listUser.value = storage.read('listUser') ?? [];
    super.onInit();
  }
}
