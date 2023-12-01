import 'package:flutter_app/app/models/api_result.dart';
import 'package:flutter_app/app/networking/api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthService extends ApiService {
  Future login({required String username, required String password}) async {
    return network<ApiResult>(
        request: (request) => request.post("auth/login",
            data: {
              "username": username,
              "password": password,
            },
            options: Options(
              validateStatus: (status) => status! < 500,
            )));
  }
}
