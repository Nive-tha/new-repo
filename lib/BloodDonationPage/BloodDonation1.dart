import 'package:flutter/material.dart';
import 'package:google/BloodDonationPage/BloodDonation2.dart';
class BloodPage1 extends StatefulWidget {
  @override
  _BloodPage1State createState() => _BloodPage1State();
}

class _BloodPage1State extends State<BloodPage1> {
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
              height: (height - bottom) * 0.16,
              width: width,
              child: Center(
                child: Container(
                  height: ((height - bottom) * 0.16) * 0.5,
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
                          size: 16,
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
                        'Find a Donor',
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ((height - bottom) * 0.85) * 0.025,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Find Blood Donors',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '& Request for Donors',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ((height - bottom) * 0.85) * 0.025,
                    ),
                    Container(
                      height: ((height - bottom) * 0.85) * 0.3,
                      width: width,
                      child: Image.asset('assets/blood.png'),
                    ),
                    SizedBox(
                      height: ((height - bottom) * 0.85) * 0.025,
                    ),
                    Text(
                      'Users will be able to find blood',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                      ),
                    ),
                    Text(
                      'donors and request for blood',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                      ),
                    ),
                    Text(
                      'Users will be able to find blood',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(
                      height: ((height - bottom) * 0.85) * 0.2,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BloodPage2()));
                      },
                      child: Container(
                        width: width * 0.2,
                        height: ((height - bottom) * 0.85) * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
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
}
