import 'package:app3/configs/route_name.dart';
import 'package:app3/models/user.dart';
import 'package:app3/provider/api.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthProvider extends GetxController {
  final user = UserModel().obs;

  final api = GetInstance().find<ApiProvider>();
  final box = GetStorage();

  setUser() async {
    api.onInit();
    var ress = await api.user();

    if (ress.isOk) {
      user(UserModel.fromJson(ress.body['data']));
    }
  }

  checkAuth() async {
    await setUser();
    if (user.value.id == null) {
      Get.offAllNamed(RouteName.login);
    } else {
      Get.offAllNamed(RouteName.home);
    }
  }
}
