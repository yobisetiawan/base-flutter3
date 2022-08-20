import 'package:app3/controllers/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:getwidget/getwidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
