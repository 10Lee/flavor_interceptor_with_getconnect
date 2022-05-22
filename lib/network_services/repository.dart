import 'package:api_auth_airsoft/config/flavor_config.dart';
import 'package:api_auth_airsoft/models/auth_response.dart';
import 'package:api_auth_airsoft/network_services/interceptor.dart';
import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';

import '../models/auth_model.dart';
import '../utils/logger.dart';

class Repository extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    allowAutoSignedCert = true;
    httpClient.baseUrl = FlavorConfig.instance.baseUrl;
    httpClient.timeout = const Duration(milliseconds: 40000);
    httpClient.addRequestModifier((request) => requestInterceptor(request));
    httpClient.addResponseModifier(
        (request, response) => responseInterceptor(request, response));
  }

  Future<AuthResponse> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    late AuthResponse? authRes;
    try {
      final response = await post(
        '/auth/register',
        {
          'email': email,
          'name': name,
          'password': password,
        },
      );
      authRes = AuthResponse.fromJson(response.body);
    } catch (error, stackTrace) {
      logger.e('registerHasError', error, stackTrace);
    }
    return authRes!;
  }
}
