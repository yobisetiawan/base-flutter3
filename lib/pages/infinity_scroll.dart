import 'package:app3/controllers/infinity.dart';
import 'package:app3/models/appointment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InfinityScrollPage extends StatelessWidget {
  const InfinityScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = Get.put(InfinityController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinity Scroll'),
      ),
      body: PagedListView<int, AppointmentModel>(
        pagingController: c.pagingController,
        builderDelegate: PagedChildBuilderDelegate<AppointmentModel>(
          itemBuilder: (context, item, index) => ListTile(
            title: Text(item.number),
            subtitle: Text(item.title),
          ),
        ),
      ),
    );
  }
}
