import 'package:app3/configs/route_name.dart';
import 'package:app3/configs/routes.dart'; 
import 'package:app3/provider/api.dart';
import 'package:app3/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await initialize();
  runApp(GetMaterialApp(
    initialRoute: RouteName.initial,
    getPages: Routes.pages,
    debugShowCheckedModeBanner: false,
  ));
}


Future initialize() async {
  await GetStorage.init();
  Get.put(ApiProvider());
  Get.put(AuthProvider());
}
