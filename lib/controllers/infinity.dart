import 'package:app3/models/appointment.dart';
import 'package:app3/provider/api.dart';
import 'package:app3/provider/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InfinityController extends GetxController with FormHelper {
  final PagingController<int, AppointmentModel> pagingController =
      PagingController(firstPageKey: 0);

  final Rx<AppointmentModel?> selectedItem =
      RxNullable<AppointmentModel?>().setNull();

  final api = Get.find<ApiProvider>();

  var titleInput = TextEditingController();
  var slugInput = TextEditingController();

  /// Called 1 frame after onInit(). It is the perfect place to enter
  /// navigation events, like snackbar, dialogs, or a new route, or
  /// async request.
  @override
  void onReady() {
    super.onReady();
    pagingController.addPageRequestListener((pageKey) {
      fetchListData(pageKey);
    });

    fetchListData(1);
  }

  fetchListData(int pageKey) async {
    var ress = await api.serviceAppointment(
        query: {'type': 'pagination', 'page': pageKey, 'limit': 30}
            .map((key, value) => MapEntry(key, value.toString())));
    Map<String, dynamic>? body = ress.body;

    if (ress.isOk) {
      var newItems = (body!['data'] as List)
          .map((i) => AppointmentModel.fromJson(i))
          .toList();

      if ((body['meta']['current_page'] ?? 0) == (body['meta']['total'] ?? 0)) {
        pagingController.appendLastPage(newItems);
      } else {
        pagingController.appendPage(
            newItems, (body['meta']['current_page'] ?? 0) + 1);
      }
    }
  }
}
