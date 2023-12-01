import 'package:flutter_app/app/models/api_result.dart';
import 'package:flutter_app/app/networking/api_service.dart';
import 'package:flutter_app/app/networking/dio/interceptors/bearer_auth_interceptor.dart';

class EventService extends ApiService {
  @override
  final interceptors = {
    BearerAuthInterceptor: BearerAuthInterceptor(),
  };
  Future getEvents() async {
    return await network<ApiResult>(
      // bearerToken: Backpack.instance.auth().authKey,
      request: (request) => request.get("events/popularevents"),
    );
  }
}
