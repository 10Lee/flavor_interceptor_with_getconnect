import 'package:api_auth_airsoft/config/flavor_config.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString token = ''.obs;

  void getData() {
    final boxReadAuth = GetStorage().read('auth');
    name.value = boxReadAuth['name'];
    email.value = boxReadAuth['email'];
    token.value = boxReadAuth['token'];
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
