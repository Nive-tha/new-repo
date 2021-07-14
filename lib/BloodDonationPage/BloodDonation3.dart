import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ReceivedRequests extends StatefulWidget {
  ReceivedRequests(this.height1, this.width1);
  var height1;
  var width1;
  @override
  _ReceivedRequestsState createState() => _ReceivedRequestsState();
}

class _ReceivedRequestsState extends State<ReceivedRequests> {
  var acceptAndCancelRequest = 20.0;
  var today = DateTime.now();
  var format;
  var timeFormat;
  @override
  Widget build(BuildContext context) {
    format = DateFormat.MMMMd().format(today);
    timeFormat = DateFormat('HH:mm').format(today);
    return Column(
      children: [
        mainContainer(),
        mainContainer(),
        mainContainer(),
        mainContainer(),
        SizedBox(
          height: widget.height1 * 0.05,
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.teal,
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
      ],
    );
  }

  Widget mainContainer() {
    return Container(
      // color: Colors.green,
      height: widget.height1,
      width: widget.width1,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: ((widget.height1) * 0.6),
                  width: widget.width1 * 0.12,
                  color: Colors.red.shade200,
                  child: Center(
                    child: Text(
                      'AB',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  height: ((widget.height1) * 0.6),
                  width: widget.width1 * 0.60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'YogeshWaran',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.teal,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.teal,
                            ),
                          ),
                          SizedBox(
                            width: (widget.width1) * 0.01,
                          ),
                          Text(
                            'Time',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            format,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.teal,
                            ),
                          ),
                          SizedBox(
                            width: (widget.width1) * 0.01,
                          ),
                          Text(
                            timeFormat,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: ((widget.height1) * 0.6),
                  width: widget.width1 * 0.2,
                  child: Column(
                    children: [
                      SizedBox(
                        height: (widget.height1) * 0.20,
                      ),
                      Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.teal,
                        ),
                      ),
                      Text(
                        'Madurai',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: (widget.height1) * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: widget.height1 * 0.35,
                width: (widget.width1 * 1 / 2) - acceptAndCancelRequest,
                color: Colors.red,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_right,
                      size: 25,
                    ),
                    Text(
                      'Accept Request',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: widget.height1 * 0.35,
                width: (widget.width1 * 1 / 2) - acceptAndCancelRequest,
                color: Colors.white,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_right,
                      size: 25,
                    ),
                    Text(
                      'Cancel Request',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: (widget.height1) * 0.05,
          ),
          Container(
            height: (widget.height1) * 0.001,
            width: widget.width1,
            color: Colors.teal,
          ),
          SizedBox(
            height: (widget.height1) * 0.01,
          ),
        ],
      ),
    );
  }
}
