import 'package:app3/configs/route_name.dart';
import 'package:app3/models/example.dart';
import 'package:app3/provider/api.dart';
import 'package:get/get.dart';

class ExampleController extends GetxController {
  var error = <String, dynamic>{}.obs;
  var isLoading = false.obs;
  var list = <ExampleModel>[].obs;

  final api = Get.find<ApiProvider>();

  /// Called 1 frame after onInit(). It is the perfect place to enter
  /// navigation events, like snackbar, dialogs, or a new route, or
  /// async request.
  @override
  void onReady() {
    super.onReady();
    fetchData();
  }

  fetchData() async {
    isLoading.value = true;
    var ress = await api.employeePosition();
    Map<String, dynamic>? body = ress.body;

    if (ress.isOk) {
      list.value =
          (body!['data'] as List).map((i) => ExampleModel.fromJson(i)).toList();
    }

    isLoading.value = false;
  }

  addForm() {
    Get.toNamed(RouteName.exampleForm);
  }

  editForm() {}
}
