import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  void checkAuth() {
    Timer(Duration(seconds: 2), () {
      if (GetStorage().hasData('auth')) {
        Get.offAllNamed('/');
      } else {
        Get.offAllNamed('/register');
      }
    });
  }

  @override
  void onReady() {
    checkAuth();
    super.onReady();
  }
}
