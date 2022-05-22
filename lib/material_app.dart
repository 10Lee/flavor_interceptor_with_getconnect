import 'package:api_auth_airsoft/pages/home/homepage.dart';
import 'package:api_auth_airsoft/pages/splash/splash_binding.dart';
import 'package:api_auth_airsoft/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/auth/auth_binding.dart';
import 'pages/auth/login.dart';
import 'pages/auth/register.dart';
import 'pages/home/home_binding.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api Authentication Api Mr.Stein',
      theme: ThemeData.dark(),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterPage(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/splash',
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),
      ],
      initialRoute: '/splash',
    );
  }
}
