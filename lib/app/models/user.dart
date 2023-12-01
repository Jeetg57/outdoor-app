import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  String? authKey;
  int? type;

  User();

  User.fromJson(dynamic data) {
    authKey = data['access_token'];
    type = data['type'];
  }

  toJson() => {"access_token": authKey, "type": type};
}
