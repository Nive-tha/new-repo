import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Pg1 extends StatefulWidget {
  Pg1(this.height1, this.width1, this.isLog);
  final height1;
  final width1;
  bool isLog;
  @override
  _Pg1State createState() => _Pg1State();
}

class _Pg1State extends State<Pg1> {
  var icon;
  var today = DateTime.now();
  var today1 = DateTime.now().toString();
  var timeFormat;
  var format;
  var timeToday = TimeOfDay.now();
  var location = "Madurai";
  hello() {
    var timeChange =
        timeFormat[0].hashCode < 2 && timeFormat[1].hashCode < 3 ? "Am" : "Pm";
    return Container(
      height: 220,
      width: 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.cake),
                    SizedBox(
                      width: (widget.width1) * 0.06,
                    ),
                    Text(
                      'Birthday Function',
                      style: TextStyle(
                        color: Colors.teal.shade400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ((widget.height1) * 0.85) * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(
                            color: Colors.teal.shade300,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: ((widget.height1) * 0.85) * 0.005,
                        ),
                        Text(
                          format,
                          style: TextStyle(
                            color: Colors.teal.shade200,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Time',
                          style: TextStyle(
                            color: Colors.teal.shade300,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: ((widget.height1) * 0.85) * 0.005,
                        ),
                        Row(
                          children: [
                            onTap(icon),
                            Text(
                              timeFormat,
                              style: TextStyle(
                                color: Colors.teal.shade200,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: (widget.width1) * 0.02,
                            ),
                            Text(
                              timeChange,
                              style: TextStyle(
                                color: Colors.teal.shade200,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                            color: Colors.teal.shade300,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: ((widget.height1) * 0.85) * 0.005,
                        ),
                        Text(
                          location,
                          style: TextStyle(
                            color: Colors.teal.shade200,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: ((widget.height1) * 0.85) * 0.03,
                ),
                Container(
                  height: ((widget.height1) * 0.85) * 0.09,
                  width: (widget.width1) * 0.65,
                  color: Colors.teal.shade50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        onTap(icon = Icons.remove_red_eye_outlined),
                        onTap(icon = Icons.edit_outlined),
                        onTap(icon = Icons.source_outlined),
                        onTap(icon = Icons.delete_outline_outlined),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ((widget.height1) * 0.85) * 0.03,
                ),
              ],
            ),
          ),
          Container(
            height: ((widget.height1) * 0.85) * 0.003,
            width: widget.width1,
            color: Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget onTap(icon) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isLog = false;
        });
      },
      child: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    format = DateFormat.MMMMd().format(today);
    timeFormat = DateFormat('HH:mm').format(today);
    return Container(
      height: widget.height1,
      width: widget.width1,
      color: Colors.white,
      child: widget.isLog == true
          ? hello()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.cake),
                      SizedBox(
                        width: (widget.width1) * 0.06,
                      ),
                      Text(
                        'Birthday Function',
                        style: TextStyle(
                          color: Colors.teal.shade400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          print('hello');
                          setState(() {
                            widget.isLog = true;
                          });
                        },
                        child: Icon(Icons.expand_more),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
