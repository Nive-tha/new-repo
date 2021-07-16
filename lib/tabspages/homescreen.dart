import 'dart:convert';
import 'package:google/BloodDonationPage/BloodDonation1.dart';
import 'package:google/calender/calender.dart';
import 'package:google/events/events.dart';
import 'package:google/familytourplan/familytourplan.dart';
import 'package:google/imagegallery.dart';
import 'package:google/jobportal/job.dart';
import 'package:google/map.dart';
import 'package:google/matrimony1.dart';
import 'package:google/treepage/tree1.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Useraccount.dart';
import 'home.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({this.googleLanding, this.faceBookLanding, this.emptyLanding});
  var faceBookLanding;
  var googleLanding;
  var emptyLanding;
  var extractedDetail;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var appbar = AppBar(
    elevation: 0,
    backgroundColor: Colors.teal,
    actions: <Widget>[
      IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {}),
    ],
  );
  bool _isSigningOut = false;

  var receiverFromRegister1;
  var nive;
  var nive1;
  var receiverPic;
  var extractedDetail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    save();
  }

//
  save() async {
    SharedPreferences get = await SharedPreferences.getInstance();
    receiverPic = get.getStringList('pic');
    print(receiverPic[0]);

    setState(() {
      nive = receiverPic[0];
    });
    print(receiverFromRegister1);
    print(nive1);
    print(34);
  }

  var username = TextEditingController();
  var email = TextEditingController();
  List images = [
    'assets/matrimony.png',
    'assets/job.png',
    'assets/tour-bus.png',
    'assets/party.png',
    'assets/image-gallery.png',
    'assets/calender.png',
    'assets/blood-donation.png',
    'assets/call.png',
    'assets/healthcare.png',
    'assets/cooking.png'
  ];
  List headings = [
    'Matrimony',
    'Job Portal',
    'Family Tour Plan',
    'Events',
    'Image Gallery',
    'Calender',
    'Blood Donate',
    'Calls',
    'Health Tips',
    'Cooking Tips'
  ];
  List movingpages = [
    Matrimony1(),
    Job(),
    FamilyTourPlan(),
    Events(),
    ImageGallery(),
    CalenderPractice(),
    BloodPage1(),
    Job(),
    FamilyTourPlan(),
    Events(),
  ];

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    // var  appbar.preferredSize.height;
    // print(
    print("71");
    // var bheight = kBottomNavigationBarHeight;
    // = MediaQuery.of(context).padding.top;

    // var leftsize = sizeHeight - (sizeHeight -
    // var sizeOrientation = MediaQuery.of(context).orientation;
    // print(sizeOrientation);

    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: ExactAssetImage('assets/hometree.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('$nive'),
                accountEmail: Text(""),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.teal[400],
                  child: Text("Hi"),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                leading: Image.asset('assets/homeicon.png'),
                title: Text("Home", style: TextStyle(color: Colors.teal[800])),
              ),
              Divider(height: 10.0, color: Colors.transparent),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                leading: Image.asset('assets/message.png'),
                title:
                    Text("Message", style: TextStyle(color: Colors.teal[800])),
              ),
              Divider(height: 10.0, color: Colors.transparent),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Tree1()));
                },
                leading: Image.asset('assets/treee.png'),
                title: Text("Family Tree",
                    style: TextStyle(color: Colors.teal[800])),
              ),
              Divider(height: 10.0, color: Colors.transparent),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyLocation()));
                },
                leading: Image.asset('assets/mapicon.png'),
                title: Text(
                  "Location",
                  style: TextStyle(color: Colors.teal[800]),
                ),
              ),
              Divider(height: 10.0, color: Colors.transparent),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Check1()));
                },
                leading: Image.asset('assets/accounticon.png'),
                title:
                    Text("Account", style: TextStyle(color: Colors.teal[800])),
              ),
              Divider(height: 10.0, color: Colors.transparent),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                leading: Image.asset('assets/logoutt.png'),
                title:
                    Text("Logout", style: TextStyle(color: Colors.teal[800])),
              ),
              Divider(height: 10.0, color: Colors.transparent),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          height: sizeHeight,
          width: sizeWidth,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: ((sizeHeight) * 0.30),
                    width: sizeWidth,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: ExactAssetImage('assets/hometree.jpg'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    height: ((sizeHeight) * 0.30),
                    width: sizeWidth,
                    color: HexColor('4D219e08'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: 35,
                                  )),
                              Icon(Icons.notifications,
                                  color: Colors.white, size: 35)
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          height: 45,
                          width: 280,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white),
                              ),
                              hintText: "Search ",
                              hintStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: new BoxDecoration(
                  // color: Colors.red,
                  image: new DecorationImage(
                    image: ExactAssetImage('assets/back.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: ((sizeHeight) * 0.70),
                child: GridView.builder(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 7),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 11,
                        mainAxisSpacing: 6,
                        childAspectRatio: 1.0),
                    itemBuilder: (context, index) {
                      return Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => movingpages[index]));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5)),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Center(
                                      child: Image.asset(
                                        images[index],
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.cyan[900],
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5)),
                                      border: Border.all(color: Colors.white)),
                                  height: 60,
                                  child: Center(
                                    child: Text(
                                      headings[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // elevation: 5,
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
