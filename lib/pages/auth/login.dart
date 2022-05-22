import 'package:api_auth_airsoft/pages/auth/auth_controller.dart';
import 'package:api_auth_airsoft/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find<AuthController>();

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _globalKey,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const Center(
                  child: Text(
                    'Login',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 50),
                InputField(
                  title: "Email",
                  hint: "Insert your email address",
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                InputField(
                  title: "Password",
                  hint: "Set a strong password",
                  controller: controller.passController,
                  isPass: true,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      // TODO : Call Login method here
                    }
                  },
                  child: const Center(
                    child: Text("Login"),
                  ),
                ),
                const SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not having an account yet?"),
                    TextButton(
                      onPressed: () => Get.offAllNamed('/register'),
                      child: const Text("Register"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
