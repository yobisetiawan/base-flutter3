
import 'package:app3/models/user.dart';
import 'package:app3/provider/api.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthProvider extends GetxController {
  var user = UserModel().obs;

  final api = GetInstance().find<ApiProvider>();
  final box = GetStorage();


  checkAuth() async {
    
  }
}
