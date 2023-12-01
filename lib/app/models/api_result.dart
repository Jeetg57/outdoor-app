import 'package:nylo_framework/nylo_framework.dart';

class ApiResult extends Model {
  bool status;
  int statusCode;
  String message;
  dynamic result;

  ApiResult({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.result,
  });

  ApiResult.fromJson(dynamic data)
      : status = data['status'] ?? false,
        statusCode = data['statusCode'],
        message = data['message'] ?? "",
        result = data['result'];
}
