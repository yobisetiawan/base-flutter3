import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'package:app3/provider/api.dart';
import 'package:app3/provider/auth.dart';
import 'package:get/get.dart';

class ChangeAvatarContorller extends GetxController {
  var error = <String, dynamic>{}.obs;
  var isLoading = false.obs;

  final api = Get.find<ApiProvider>();
  final auth = Get.find<AuthProvider>();

  pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      await api.changeAvatar(FormData({
        'avatar': MultipartFile(File(result.files.single.path ?? ''),
            filename: result.files.single.name),
      }));

      await auth.setUser();
      Get.back();
    } else {
      // User canceled the picker
    }
  }
}
