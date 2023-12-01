import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/event.dart';
import 'package:flutter_app/config/design.dart';
import 'package:flutter_app/resources/pages/event_details_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/events_controller.dart';

class EventsPage extends NyStatefulWidget<EventsController> {
  static const path = '/events';

  EventsPage() : super(path, child: _EventsPageState());
}

class _EventsPageState extends NyState<EventsPage> {
  List<Event> events = [];
  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Events")),
      body: Consumer(builder: (context, ref, child) {
        return ref.watch(eventsFutureProvider).when(
            data: (events) {
              return ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventDetailsPage(
                                      event: events[index],
                                    )));
                        // routeTo(EventDetalsPage.path
                      },
                      leading: Hero(
                        tag: events[index],
                        child: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(events[index].onlineUrl ?? "")),
                      ),
                      title: Text(events[index].title ?? ""),
                      subtitle: Text(events[index].description ?? ""),
                      // trailing: Text(events[index].startDate ?? ""),
                    );
                  });
            },
            error: (error, stackTrace) {
              return Text(stackTrace.toString());
            },
            loading: () => loader);
      }),
    );
  }
}
