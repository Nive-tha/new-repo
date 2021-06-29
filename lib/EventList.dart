import 'package:flutter/material.dart';
import 'package:google/Useraccount.dart';
import 'package:google/tabspages/accountscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Eventlist extends StatefulWidget {
  const Eventlist({Key? key}) : super(key: key);

  @override
  _EventlistState createState() => _EventlistState();
}

class _EventlistState extends State<Eventlist> {
  void initState() {
    // TODO: implement initState
    super.initState();
    even();
  }

  var firstText;
  var secondText;
  var thirdText;
  var fourthText;
  var fifthText;
  var tap;
  var email;
  var icon;
  var text;
  var receive;
  var name;
  var mail;
  var onTap;
  var event;
  var event1;
  var event2;
  var event3;
  var event4;
  var event5;
  var event6;
  var event7;
  var event8;
  var event9;
  var event10;

  even() async {
    SharedPreferences pre = await SharedPreferences.getInstance();

    setState(() {
      event = pre.getStringList('event');
      event1 = event[0];
      print(event1);
      print(event);

      event2 = event[1];
      print(event2);
      event3 = event[2];
      print(event3);
      event4 = event[3];
      event5 = event[4];
      event6 = event[5];
      event7 = event[6];
      event8 = event[7];
      event9 = event[8];
      event10 = event[9];
    });
  }

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
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                          ),
                          iconSize: 20,
                          color: Colors.teal,
                          splashColor: Colors.tealAccent,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new Check1()));
                          },
                        ),
                        Text(
                          'EventList',
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
                          // CircleAvatar(
                          //   backgroundColor: Colors.teal,
                          //   radius: 35,
                          // ),
                          SizedBox(
                            width: 20,
                          ),
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Align(
                          //       alignment: Alignment.centerLeft,
                          //       child: Text(
                          //         '$name',
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             color: Colors.teal,
                          //             fontSize: 16),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       height: 5,
                          //     ),
                          //     Text(
                          //       '$name' 'Bond Family',
                          //       style:
                          //           TextStyle(fontSize: 12, color: Colors.teal),
                          //     ),
                          //   ],
                          // ),
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
                            cardContainer(
                                height,
                                width,
                                firstText = '$event1',
                                secondText = '$event2',
                                thirdText = '$event3',
                                fourthText = '$event4',
                                fifthText = '$event5',
                                tap = null),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            cardContainer(
                                height,
                                width,
                                firstText = '$event6',
                                secondText = '$event7',
                                thirdText = '$event8',
                                fourthText = '$event9',
                                fifthText = '$event10',
                                tap = null),
                          ],
                        ),
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

  Widget cardContainer(double height, double width, firstText, secondText,
      thirdText, fourthText, fifthText, tap) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => tap));
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        // height: (((height * 0.4) * 0.45) * 0.5) - 20,
        // width: (width * 1 / 3) - 13.4,
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
              Text(
                thirdText,
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),
              Text(
                fourthText,
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),
              Text(
                fifthText,
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
