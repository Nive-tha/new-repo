import 'package:flutter/material.dart';
import 'package:google/Events1/receivedevents.dart';

import 'package:intl/intl.dart';

import 'event2.dart';
import 'event3.dart';

class EventPage1 extends StatefulWidget {
  @override
  _EventPage1State createState() => _EventPage1State();
}

class _EventPage1State extends State<EventPage1>
    with SingleTickerProviderStateMixin {
  var indicatorColor = Colors.orange;
  @override
  void initState() {
    super.initState();
    tabi = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabi.dispose();
    super.dispose();
  }

  var tabi;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final pad = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: ((height) * 0.15),
              width: width,
              color: Colors.teal,
              child: Center(
                child: Container(
                  height: ((height) * 0.15) * 0.5,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Events',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: (height) * 0.85,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: ((height) * 0.85) * 0.1,
                    width: width,
                    child: TabBar(
                      indicatorColor: indicatorColor,
                      automaticIndicatorColorAdjustment: false,
                      controller: tabi,
                      tabs: [
                        Text(
                          'My Events',
                          style: TextStyle(color: Colors.teal),
                        ),
                        Text(
                          'Received Events',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ((height) * 0.85) * 0.02,
                  ),
                  Container(
                    height: ((height) * 0.85) * 0.88,
                    width: width,
                    child: TabBarView(
                      controller: tabi,
                      children: [
                        Pg1(((height) * 0.85 * 0.8), width, false),
                        Pg2(((height) * 0.85 * 0.8), (width)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
