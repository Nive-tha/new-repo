import 'package:flutter/material.dart';
import 'package:google/matrimony1.dart';
import 'package:google/matrimony2.dart';
import 'package:google/matrimony3.dart';
// import 'package:hometabview/check1.dart';

class Check1 extends StatefulWidget {
  @override
  Check1State createState() => Check1State();
}

class Check1State extends State<Check1> {
  var firstText;
  var secondText;
  var tap;
  var email;
  var icon;
  var text;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: height * 0.15,
              width: width,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Center(
                  child: Container(
                    height: height * 0.071,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.teal,
                        ),
                        Text(
                          'Account',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.teal),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: height * 0.75,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                children: [
                  Container(
                    height: (height * 0.80) * 0.15,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 35,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'James',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'James Bond Family',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.teal),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 4, right: 4, top: 20, bottom: 10),
                    height: (height * 0.8) * 0.45,
                    width: width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            cardContainer(height, width, firstText = '2',
                                secondText = 'Family names', tap = Check1()),
                            cardContainer(height, width, firstText = '1',
                                secondText = 'Locations', tap = Check1()),
                            cardContainer(height, width, firstText = '3',
                                secondText = 'Relationships', tap = Check1()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            cardContainer(height, width, firstText = '1',
                                secondText = 'Occupations', tap = Matrimony3()),
                            cardContainer(height, width, firstText = '0',
                                secondText = 'Events', tap = Matrimony2()),
                            cardContainer(height, width, firstText = '0',
                                secondText = 'Matrimony', tap = Matrimony1()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: (height * 0.24),
                    width: width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        containerRowPadding(
                            height,
                            width,
                            text = 'jamesbondfamily152@gmail.com',
                            icon = Icons.message),
                        containerRowPadding(
                            height,
                            width,
                            text = 'invitations List',
                            icon = Icons.insert_invitation),
                        containerRowPadding(height, width,
                            text = 'Change Password', icon = Icons.lock),
                        containerRowPadding(height, width, text = 'Logout',
                            icon = Icons.logout),
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

  Widget containerRowPadding(double height, double width, text, icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          Container(
            height: (height * 0.24) * 0.19,
            width: width * 0.2,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Icon(
                icon,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: width * 0.77,
// height: (height 0.24) 0.19,
            child: Text(
              text,
              style: TextStyle(fontSize: 12, color: Colors.teal),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardContainer(
      double height, double width, firstText, secondText, tap) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => tap));
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        height: (((height * 0.8) * 0.45) * 0.5) - 20,
        width: (width * 1 / 3) - 13.4,
        child: Card(
          color: Colors.teal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                firstText,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                secondText,
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
