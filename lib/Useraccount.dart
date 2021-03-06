import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google/EventList.dart';
import 'package:google/jobportal/job.dart';
import 'package:google/matrimony1.dart';
import 'package:google/matrimony2.dart';
import 'package:google/matrimony3.dart';
import 'package:google/treeviewpagecreation/pagescreation/fatherdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginPage/Landingpage.dart';
import 'LoginPage/Mail.dart';
import 'events/events.dart';
import 'map.dart';
import 'package:http/http.dart' as http;
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
  var receive;
  var name;
  var mail;
  var onTap;
  var receiveId;
  var fam_id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    save();
    _read();
  }

  _read() async {
// print('func');

    SharedPreferences prefer = await SharedPreferences.getInstance();
    receiveId = prefer.getStringList('idS');
    fam_id = receiveId[1].toString();

    print(receiveId[1]);

    final String url =
<<<<<<< HEAD
        "http://bdb62dc1e609.ngrok.io/parampara/userpersonal/getevents";
=======
        "http://1cfc77d745bf.ngrok.io/parampara/userpersonal/getevents";
>>>>>>> Malathy
    final response =
        await http.post(Uri.parse(url), body: {'family_id': fam_id});
    print(response);
    print(response.body);
    var receivedDetails = json.decode(response.body);
    print(receivedDetails);
    // var extractedDetail = receivedDetails['status_code'];
    // print(extractedDetail);

    var extractedDetail = receivedDetails['result'][0]['user_name'];

    print(extractedDetail);
    for (int i = 0; i < extractedDetail.length; i++) {
      var item = i;
      print(item);
    }
    var extractedDetail1 = receivedDetails['result'][0]['place'];
    print(extractedDetail1);
    var extractedDetail2 = receivedDetails['result'][0]['event_name'];
    print(extractedDetail2);
    var extractedDetail3 = receivedDetails['result'][0]['event_date'];
    print(extractedDetail3);
    var extractedDetail4 = receivedDetails['result'][0]['event_time'];
    print(extractedDetail4);
    var extractedDetai = receivedDetails['result'][0]['user_name'];
    print(extractedDetai);
    var extractedDetai1 = receivedDetails['result'][1]['place'];
    print(extractedDetai1);
    var extractedDetai2 = receivedDetails['result'][1]['event_name'];
    print(extractedDetai2);
    var extractedDetai3 = receivedDetails['result'][1]['event_date'];
    print(extractedDetai3);
    var extractedDetai4 = receivedDetails['result'][1]['event_time'];
    print(extractedDetai4);
    var extracted = receivedDetails['result'].length;
    print(extracted);
    List<String> stringList = [
      extractedDetail,
      extractedDetail1,
      extractedDetail2,
      extractedDetail3,
      extractedDetail4,
      extractedDetai,
      extractedDetai1,
      extractedDetai2,
      extractedDetai3,
      extractedDetai4
    ];

    SharedPreferences pre = await SharedPreferences.getInstance();
    await pre.setStringList('event', stringList);
  }

  save() async {
    SharedPreferences get = await SharedPreferences.getInstance();
    receive = get.getStringList('pic');
    print(receive[0]);
    print(receive[1]);

    setState(() {
      name = receive[0];
      mail = receive[1];
    });
  }

  logOut() async {
    SharedPreferences get = await SharedPreferences.getInstance();
    get.clear();
    get.remove('pic');
    Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (BuildContext context) => new Mail()));
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
                                        new LandingPage()));
                          },
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
                            backgroundColor: Colors.teal,
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
                                  '$name',
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
                                '$name' 'Bond Family',
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
                            cardContainer(
                                height,
                                width,
                                firstText = '2',
                                secondText = 'Family names',
                                tap = FatherDetails()),
                            cardContainer(height, width, firstText = '1',
                                secondText = 'Locations', tap = MyLocation),
                            cardContainer(
                                height,
                                width,
                                firstText = '3',
                                secondText = 'Relationships',
                                tap = FatherDetails()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            cardContainer(height, width, firstText = '1',
                                secondText = 'Occupations', tap = Job()),
                            cardContainer(height, width, firstText = '0',
                                secondText = 'Events', tap = Eventlist()),
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
                        containerRowPadding(height, width, text = '$mail',
                            icon = Icons.message, onTap = null),
                        containerRowPadding(
                            height,
                            width,
                            text = 'invitations List',
                            icon = Icons.insert_invitation,
                            onTap = null),
                        containerRowPadding(
                            height,
                            width,
                            text = 'Change Password',
                            icon = Icons.lock,
                            onTap = null),
                        containerRowPadding(height, width, text = 'Logout',
                            icon = Icons.logout, onTap = logOut),
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

  Widget containerRowPadding(double height, double width, text, icon, onTap) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
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
