import 'package:api_auth_airsoft/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(title: Text("Homepage")),
      body: Center(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Name : ${controller.name}"),
              Text("Email : ${controller.email}"),
              Text("Token : ${controller.token}"),
            ],
          ),
        ),
      ),
    );
  }
}
