import 'package:flutter/material.dart';
import 'package:google/Events1/receivedevents.dart';
import 'package:intl/intl.dart';

class Pg2 extends StatefulWidget {
  Pg2(this.height2, this.width2);
  final height2;
  final width2;
  @override
  _Pg2State createState() => _Pg2State();
}

class _Pg2State extends State<Pg2> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: (widget.height2) * 0.15,
            width: (widget.width2) * 0.5,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ReceivedEvents(((height) * 0.85 * 0.8), (width))));
              },
              child: Card(
                child: Padding(
                  padding: EdgeInsets.only(right: 300),
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        "shivangi.jpg",
                        width: 30,
                        fit: BoxFit.fill,
                      ),
                    ),
                    radius: 50,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ));
      },
    ));

    //
    // return Container(
    //
    //   height: widget.height2,
    //
    //   width: widget.width2,
    //
    //   padding: EdgeInsets.symmetric(horizontal: 20),
    //
    //   child: Row(
    //
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //
    //     children: [
    //
    //       Container(
    //
    //           height: (widget.height2) * 0.15,
    //
    //           width: (widget.width2) * 0.9,
    //
    //           child: Card(
    //
    //             child: CircleAvatar(
    //
    //               // radius: 2,
    //
    //               backgroundColor: Colors.teal,
    //
    //             ),
    //
    //           )),
    //
    //     ],
    //
    //   ),
    //
    // );
  }
}
