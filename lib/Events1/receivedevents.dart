import 'package:flutter/material.dart';
import 'package:google/Events1/event3.dart';

import 'event1.dart';

class ReceivedEvents extends StatefulWidget {
  ReceivedEvents(this.height2, this.width2);
  final height2;
  final width2;
  @override
  _ReceivedEventsState createState() => _ReceivedEventsState();
}

class _ReceivedEventsState extends State<ReceivedEvents> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: (widget.height2) * 0.4,
        width: (widget.width2) * 0.7,
        child: Card(
          color: Colors.teal[50],
          child: InkWell(
            onTap: () {
              {}
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventPage1(),
                  ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.close),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
