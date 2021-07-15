import 'package:flutter/material.dart';

import 'BloodDonation5.dart';

class BloodPage2 extends StatefulWidget {
  @override
  _BloodPage2State createState() => _BloodPage2State();
}

class _BloodPage2State extends State<BloodPage2> {
  var text;
  var left = 21.0;
  var right = 21.0;
  var top = 20.0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var bottom = kBottomNavigationBarHeight;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: (height - bottom) * 0.15,
              width: width,
              child: Center(
                child: Container(
                  height: ((height - bottom) * 0.15) * 0.5,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.teal,
                          size: 15,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Text(
                        'Blood Donate',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: ((height - bottom) * 0.85),
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: top,
                  left: left,
                  right: right,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Find Donor',
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ((height - bottom) * 0.85) * 0.025,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Search for blood donors around you',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ((height - bottom) * 0.85) * 0.025,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Choose Blood Group',
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: ((height - bottom) * 0.85) * 0.023,
                    ),
                    Container(
                      height: ((height - bottom) * 0.85) * 0.12,
                      width: width,
                      color: Colors.grey.shade50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          cardBloodGroup(height, width, bottom, text = "A+"),
                          cardBloodGroup(height, width, bottom, text = "A-"),
                          cardBloodGroup(height, width, bottom, text = "B-"),
                          cardBloodGroup(height, width, bottom, text = "O+"),
                          cardBloodGroup(height, width, bottom, text = "O-"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ((height - bottom) * 0.85) * 0.01,
                    ),
                    Container(
                      height: ((height - bottom) * 0.85) * 0.12,
                      width: width,
                      color: Colors.grey.shade50,
                      child: Row(
                        children: [
                          cardBloodGroup(height, width, bottom, text = "AB+"),
                          cardBloodGroup(height, width, bottom, text = "B+"),
                          cardBloodGroup(height, width, bottom, text = "AB-"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ((height - bottom) * 0.85) * 0.03,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Location',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ((height - bottom) * 0.85) * 0.020,
                    ),
                    Container(
                      height: ((height - bottom) * 0.85) * 0.1,
                      width: width,
                      // color: Colors.grey.shade100,
                      child: Card(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Enter your Location',
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ((height - bottom) * 0.85) * 0.1,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red.shade300,
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.30,
                          vertical: ((height - bottom) * 0.85) * 0.025,
                        ),
                      ),
                      child: Text(
                        'Search  Donor',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuccessfullyRequested()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardBloodGroup(height, width, bottom, text) {
    var sizePad = MediaQuery.of(context).removePadding();
    return Container(
      height: ((height - bottom) * 0.85) * 0.12,
      width: (width - (left + right)) / 5,
      child: Card(
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.teal,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
