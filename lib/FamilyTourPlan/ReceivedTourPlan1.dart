import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Received2.dart';

class ReceivedTourPlan1 extends StatefulWidget {
  ReceivedTourPlan1({Key key}) : super(key: key);

  @override
  _ReceivedTourPlan1State createState() => _ReceivedTourPlan1State();
}

class _ReceivedTourPlan1State extends State<ReceivedTourPlan1> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[HexColor('#0A4E51'), HexColor('#149BA1')])),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Tour Plan",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Received()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 100,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: HexColor("#35173B"),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "27-jun-21",
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Row(
                            children: [
                              Image.asset(
                                "assets/FamilyTourPlan/tourplace.png",
                                width: 50,
                                height: 50,
                              ),
                              Text(
                                "   Kodaikanal",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              )
                            ],
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
