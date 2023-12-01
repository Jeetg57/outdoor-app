import 'package:flutter_app/app/models/event.dart';
import 'package:flutter_app/app/networking/event_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'controller.dart';
import 'package:flutter/widgets.dart';

class EventsController extends Controller {
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<List<Event>> getEvents() async {
    try {
      final result = await EventService().getEvents();
      if (result != null && result.status == true) {
        return result.result
            .map<Event>((event) => Event.fromJson(event))
            .toList();
      } else {
        print(result);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}

final eventsProvider = Provider((ref) => EventsController());

final eventsFutureProvider = FutureProvider((ref) async {
  final events = ref.watch(eventsProvider);
  return events.getEvents();
});
