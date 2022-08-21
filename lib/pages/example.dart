import 'package:app3/controllers/example.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = Get.put(ExampleController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Crud'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: c.list.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(c.list[index].title),
            subtitle: Text(c.list[index].slug),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          c.addForm();
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ExampleFormPage extends StatelessWidget {
  const ExampleFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Crud Form'),
      ),
      body: const Text('Ini Form'),
    );
  }
}
