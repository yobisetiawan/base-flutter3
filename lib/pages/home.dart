import 'package:app3/controllers/login.dart';
import 'package:app3/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:getwidget/getwidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthProvider>();
    var c = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const SizedBox(
            height: 15,
          ),
          Obx(
            () => Text(auth.user.value.email ?? 'no User'),
          ),
          ElevatedButton(
            onPressed: () {
              c.fetrchUser();
            },
            child: const Text('Fetch User'),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () {
              c.logout();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
