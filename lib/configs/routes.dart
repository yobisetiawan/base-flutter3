import 'package:app3/configs/route_name.dart';
import 'package:app3/pages/home.dart';
import 'package:app3/pages/login.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage<dynamic>> pages = [
    GetPage(name: RouteName.initial, page: () => const LoginPage()),
    GetPage(name: RouteName.login, page: () => const LoginPage()),
    GetPage(name: RouteName.home, page: () => const HomePage()),
  ];
}
