import 'package:flutter_app/app/controllers/controller.dart';
import 'package:flutter_app/app/networking/auth_service.dart';
import 'package:flutter_app/config/storage_keys.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../models/user.dart';

class AuthenticationController extends Controller {
  @override
  construct(context) {
    super.construct(context);
  }

  Future<void> logout() async {
    await Auth.logout();
    await routeToInitial(navigationType: NavigationType.pushReplace);
  }

  Future<String?> login(
      {required String username, required String password}) async {
    final result =
        await AuthService().login(username: username, password: password);
    print("result: ${result.status}");
    try {
      if (result != null && result.status == true) {
        User user = User.fromJson(result.result);
        await Auth.set(user);
        Backpack.instance.set(StorageKey.userToken, user.authKey);
        await routeTo(HomePage.path,
            navigationType: NavigationType.pushReplace);
        return null;
      } else {
        print(result);
        return result.message;
      }
    } catch (e) {
      print(e);
      return "An error occurred";
    }
  }
}
