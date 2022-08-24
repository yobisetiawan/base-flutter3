import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RxNullable<T> {
  Rx<T> setNull() => (null as T).obs;
}

class FormHelper {
  confirmAlert(BuildContext context, List<Widget>? actions,
      {String title = 'Alert', String description = 'description'}) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: actions,
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  baseShowError(Response<dynamic> ress, RxMap<String, dynamic> error) {
    if (ress.statusCode == 422) {
      error.value = ress.body!['errors'];
    } else {
      Get.snackbar(
        ress.statusCode.toString(),
        ress.body!['message'] ?? '',
      );
    }
  }
}
