import 'package:flutter/material.dart';
import 'package:google/BloodDonationPage/BloodDonation3.dart';
// import '../bloodgroup/my_requests.dart';


class RequestForBlood1 extends StatefulWidget {
  @override
  _RequestForBlood1State createState() => _RequestForBlood1State();
}

class _RequestForBlood1State extends State<RequestForBlood1>
    with SingleTickerProviderStateMixin {
  var onlyPaddingtop = 20.0;
  var controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
              height: ((height) * 0.15),
              width: width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    height: ((height) * 0.15) * 0.5,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.teal,
                          size: 18,
                        ),
                        SizedBox(
                          width: (width) * 0.05,
                        ),
                        Text(
                          'Request For Blood',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: ((height) * 0.85),
              width: width,
              padding:
                  EdgeInsets.only(left: 10.0, right: 10.0, top: onlyPaddingtop),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'See received blood request and also',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'check your requests status',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  SizedBox(height: (height * 0.85) * 0.05),
                  Container(
                    height: ((height) * 0.85) * 0.03,
                    width: width,
                    child: TabBar(
                      controller: controller,
                      tabs: [
                        Text(
                          'Received Requests',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'My Requests',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ((height) * 0.85) * 0.01),
                  Container(
                    height: ((height) * 0.85) * 0.001,
                    width: width,
                    color: Colors.teal,
                  ),
                  SizedBox(
                    height: ((height) * 0.85) * 0.01,
                  ),
                  Container(
                    height: ((height) * 0.85) * 0.79,
                    child: TabBarView(
                      controller: controller,
                      children: [
                        ReceivedRequests(
                            ((((height) * 0.85) * 0.79) * 0.22), width),
              
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
