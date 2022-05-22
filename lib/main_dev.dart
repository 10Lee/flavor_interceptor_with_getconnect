import 'package:api_auth_airsoft/config/variables.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'config/flavor_config.dart';
import 'material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  FlavorConfig(
    flavor: Flavor.dev,
    baseUrl: 'https://openapi.mrstein.web.id',
    appName: '[DEV] $kAppName',
  );

  runApp(MyApp());
}
