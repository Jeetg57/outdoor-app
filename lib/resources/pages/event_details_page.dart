import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_app/app/models/event.dart';
import 'package:nylo_framework/nylo_framework.dart';

class EventDetailsPage extends NyStatefulWidget {
  static const path = '/event-detals';
  final Event event;

  EventDetailsPage({required this.event})
      : super(path, child: _EventDetailsPageState());
}

class _EventDetailsPageState extends NyState<EventDetailsPage> {
  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Event Details")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: widget.event,
                child: Image.network(widget.event.onlineUrl ?? "")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.event.title ?? "").animate().fade(),
                  Text(widget.event.description ?? ""),
                  Row(
                    children: [
                      Text(widget.event.priceCountry ?? ""),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Text(widget.event.price.toString())),
                    ],
                  ),
                  Text(widget.event.registrationDeadline ?? ""),
                  Text(widget.event.address ?? ""),
                  Text(widget.event.eventCategory ?? ""),
                  Text(widget.event.cCount.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
