import 'package:app3/controllers/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:getwidget/getwidget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Obx(
            () {
              var e = (c.error['email'] ?? []).join(', ');
              return TextField(
                controller: c.emailInput,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Email',
                  errorText: e != '' ? e : null,
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
        
           Obx(
            () {
              var e = (c.error['password'] ?? []).join(', ');
              return TextField(
                controller: c.passInput,
                 obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  errorText: e != '' ? e : null,
                ),
              );
            },
          ),

          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                c.login();
              },
              child: const Text('Login')),
        ],
      ),
    );
  }
}
