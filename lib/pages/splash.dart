import 'package:app3/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:getwidget/getwidget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthProvider>();
    auth.checkAuth();

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
