import 'package:app3/controllers/change_avatar.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeAvatarPage extends StatelessWidget {
  const ChangeAvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = Get.put(ChangeAvatarContorller());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Avatar'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ElevatedButton(onPressed: () {
            c.pickFile();
          }, child: const Text('Pick File')),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Submit')),
        ],
      ),
    );
  }
}
