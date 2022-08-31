import 'package:app3/configs/env.dart';
import 'package:app3/configs/route_name.dart';
import 'package:app3/provider/api.dart';
import 'package:app3/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var error = <String, dynamic>{}.obs;
  var isLoading = false.obs;

  final api = Get.find<ApiProvider>();
  final auth = Get.find<AuthProvider>();

  var emailInput = TextEditingController();
  var passInput = TextEditingController();

  final box = GetStorage();

  login() async {
    isLoading.value = true;

    var ress =
        await api.login({'email': emailInput.text, 'password': passInput.text});
    Map<String, dynamic>? body = ress.body;

    if (ress.isOk) {
      error.value = {};
      box.write(Env.storageToken, body!['token']);

      await auth.setUser();
      Get.offAllNamed(RouteName.home);
    } else {
      if (ress.statusCode == 422) {
        error.value = body!['errors'];
      } else {
        Get.snackbar(
          ress.statusCode.toString(),
          body!['message'] ?? '',
        );
      }
    }

    isLoading.value = false;
  }

  logout() async {
    isLoading.value = true;
    await api.logout();

    box.remove(Env.storageToken);

    Get.offAllNamed(RouteName.login);

    isLoading.value = false;
  }

  fetrchUser() async {
    await auth.setUser();
  }
}
