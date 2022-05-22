import 'package:api_auth_airsoft/config/flavor_config.dart';
import 'package:api_auth_airsoft/network_services/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/data.dart';
import '../../utils/logger.dart';

class AuthController extends GetxController {
  GetStorage box = GetStorage();
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passController;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    nameController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passController.dispose();
  }

  Repository repo = Get.find<Repository>();

  void submitAccount() {
    print("ERROR MESSAGE: " + FlavorConfig.instance.baseUrl.toString());
    isLoading.value = true;
    repo
        .registerUser(
      email: emailController.text,
      name: nameController.text,
      password: passController.text,
    )
        .then(
      (value) {
        if (value.success!) {
          print(value.data.toString());

          box.write('auth', {
            'name': value.data!.name,
            'email': value.data!.email,
            'token': value.data!.token,
          }).then((value) => Get.offAllNamed('/splash'));
          isLoading.value = false;
        } else {
          logger.e('the response is not success');
        }
      },
    );
  }
}
