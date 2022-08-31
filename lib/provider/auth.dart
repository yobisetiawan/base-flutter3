import 'package:app3/configs/env.dart';
import 'package:app3/configs/route_name.dart';
import 'package:app3/models/user.dart';
import 'package:app3/provider/api.dart';
import 'package:app3/provider/helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthProvider extends GetxController {
  final Rx<UserModel?> user = RxNullable<UserModel?>().setNull();

  final api = GetInstance().find<ApiProvider>();
  final box = GetStorage();

  final fcm = ''.obs;

  setUser() async {
    api.onInit();
    var ress = await api.user();

    if (ress.isOk) {
      user(UserModel.fromJson(ress.body['data']));
    }

    if (fcm.value == '' && user.value != null) {
      var fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != '') {
        await api.fcm({'fcm_token': fcmToken});

        fcm.value = fcmToken!;
      }
    }
  }

  checkAuth() async {
    await setUser();
    if (user.value == null) {
      Get.offAllNamed(RouteName.login);
      box.remove(Env.storageToken);
    } else {
      Get.offAllNamed(RouteName.home);
    }
  }
}
