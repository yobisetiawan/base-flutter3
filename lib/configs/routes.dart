import 'package:app3/configs/route_name.dart';
import 'package:app3/pages/change_avatar.dart';
import 'package:app3/pages/example.dart';
import 'package:app3/pages/home.dart';
import 'package:app3/pages/login.dart';
import 'package:app3/pages/splash.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage<dynamic>> pages = [
    GetPage(name: RouteName.initial, page: () => const SplashPage()),
    GetPage(name: RouteName.login, page: () => const LoginPage()),
    GetPage(name: RouteName.home, page: () => const HomePage()),
    GetPage(name: RouteName.example, page: () => const ExamplePage()),
    GetPage(name: RouteName.exampleForm, page: () => const ExampleFormPage()),
    GetPage(name: RouteName.changeAvatar, page: () => const ChangeAvatarPage()),
  ];
}
