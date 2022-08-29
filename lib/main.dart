import 'package:app3/configs/route_name.dart';
import 'package:app3/configs/routes.dart';
import 'package:app3/provider/api.dart';
import 'package:app3/provider/auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

//firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initialize();

  final fcmToken = await FirebaseMessaging.instance.getToken();

  print(fcmToken);

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
