import 'package:app3/configs/env.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Env.apiHost;
    httpClient.addRequestModifier((Request request) async {
      final box = GetStorage();

      var token = box.read(Env.storageToken);

      request.headers['Accept'] = 'application/json';
      request.headers['Connection'] = 'keep-alive';
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['X-PUBLIC-TOKEN'] = Env.apiPublicToken;

      return request;
    });
  }

  Future<Response> login(data) => post('/auth/login', data);

  Future<Response> register(data) => post('/auth/register', data);

  Future<Response> logout() => get('/auth/logout');

  Future<Response> user() => get('/user', query: {'relations': 'avatar'});

  Future<Response> employeePosition() => get('/employee/positions');

  Future<Response> employeePositionPost(data) =>
      post('/employee/positions', data);

  Future<Response> employeePositionPut(id, data) =>
      put('/employee/positions/$id', data);

  Future<Response> employeePositionDelete(id) =>
      delete('/employee/positions/$id');
}
