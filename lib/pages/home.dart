import 'package:app3/configs/route_name.dart';
import 'package:app3/controllers/login.dart';
import 'package:app3/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
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
            () => Center(
              child: Column(
                children: [
                  Text(auth.user.value?.name ?? '-'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(auth.user.value?.email ?? '-')
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Obx(
            () {
              if (auth.user.value?.avatar?.url != null) {
                return Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: GFAvatar(
                      backgroundImage:
                          NetworkImage(auth.user.value?.avatar?.url ?? ''),
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () {
              c.fetrchUser();
            },
            child: const Text('Fetch User'),
          ),
          ElevatedButton(
            onPressed: () {
              c.logout();
            },
            child: const Text('Logout'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(RouteName.example);
            },
            child: const Text('Example CRUD'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(RouteName.changeAvatar);
            },
            child: const Text('Change Avatar'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(RouteName.infinityScroll);
            },
            child: const Text('Infinniti Scroll'),
          ),
        ],
      ),
    );
  }
}
