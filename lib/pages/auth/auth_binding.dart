import 'package:api_auth_airsoft/network_services/repository.dart';
import 'package:get/instance_manager.dart';

import 'auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => Repository());
  }
}
