import 'package:app3/configs/route_name.dart';
import 'package:app3/models/example.dart';
import 'package:app3/provider/api.dart';
import 'package:app3/provider/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExampleController extends GetxController with FormHelper {
  var error = <String, dynamic>{}.obs;
  var isLoading = false.obs;
  var isFormLoading = false.obs;
  var list = <ExampleModel>[].obs;

  final Rx<ExampleModel?> selectedItem = RxNullable<ExampleModel?>().setNull();

  final api = Get.find<ApiProvider>();

  var titleInput = TextEditingController();
  var slugInput = TextEditingController();

  /// Called 1 frame after onInit(). It is the perfect place to enter
  /// navigation events, like snackbar, dialogs, or a new route, or
  /// async request.
  @override
  void onReady() {
    super.onReady();
    fetchListData();
  }

  fetchListData() async {
    isLoading.value = true;
    var ress = await api.employeePosition();
    Map<String, dynamic>? body = ress.body;

    if (ress.isOk) {
      list.value =
          (body!['data'] as List).map((i) => ExampleModel.fromJson(i)).toList();
    }

    isLoading.value = false;
  }

  clearState() {
    selectedItem.value = null;
    error.value = {};
    titleInput.text = '';
    slugInput.text = '';
  }

  editForm(item) {
    selectedItem(item);

    titleInput.text = selectedItem.value?.title ?? '';
    slugInput.text = selectedItem.value?.slug ?? '';

    Get.toNamed(RouteName.exampleForm);
  }

  createForm() {
    clearState();
    Get.toNamed(RouteName.exampleForm);
  }

  submitForm() async {
    isFormLoading.value = true;

    Response<dynamic> ress;

    if (selectedItem.value?.id != null) {
      ress = await api.employeePositionPut(selectedItem.value?.id,
          {'title': titleInput.text, 'slug': slugInput.text, 'is_active': 1});
    } else {
      ress = await api.employeePositionPost(
          {'title': titleInput.text, 'slug': slugInput.text, 'is_active': 1});
    }

    if (ress.isOk) {
      await fetchListData();
      Get.back();
    } else {
      baseShowError(ress, error);
    }

    isFormLoading.value = false;
  }

  deleteItem() async {
    await api.employeePositionDelete(selectedItem.value?.id);
    await fetchListData();
    Get.back();
  }

  confirm(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {
        deleteItem();
      },
    );

    confirmAlert(context, [cancelButton, continueButton],
        title: 'Are you Sure', description: 'This cant be undone');
  }
}
