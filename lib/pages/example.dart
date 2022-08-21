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
            onTap: () {
              c.setSelectedItem(c.list[index]);
            },
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
    var c = Get.find<ExampleController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Crud Form'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
         
          Obx(
            () {
              var e = (c.error['title'] ?? []).join(', ');
              return TextField(
                controller: c.titleInput,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Title',
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
              var e = (c.error['slug'] ?? []).join(', ');
              return TextField(
                controller: c.slugInput,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Slug',
                  errorText: e != '' ? e : null,
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                c.submitForm();
              },
              child: const Text('Submit')),
        ],
      ),
    );
  }
}
