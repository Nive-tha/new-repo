import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      nive= receiverPic[0];

    });
     print(receiverFromRegister1);
     print(nive1);
     print(34);

  }



  var username = TextEditingController();
  var email = TextEditingController();

  List images = [
    'assets/wedding.png',
    'assets/job.png',
    'assets/familytour.png',
    'assets/eventsfam.png',
    'assets/gallery.png',
    'assets/calender.png',
    'assets/blood.png',
    'assets/REG2.png',
    'assets/healthtips.png',
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
  @override

    Widget build(BuildContext context) {




    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeOrientation = MediaQuery.of(context).orientation;
    print(sizeOrientation);
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      body: Container(
        child: Column(
          children: [
            Container(
              height: sizeHeight * 0.19,
              width: sizeWidth,
              padding: EdgeInsets.only(top: 40, left: 15, right: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            // decoration: BoxDecoration(color: Colors.teal),
                  // child: CircleAvatar(backgroundImage: NetworkImage(extractedDetail))

                            child:Icon(
                                                Icons.account_circle,
                                                size: 70.0,
                                                color: Colors.white,
                                              ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            // height: 80,
                            // width: 120,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 40,
                                  width: 200,
                                  child: GestureDetector(
                                    onTap: () async {
                                      SharedPreferences clear = await SharedPreferences.getInstance();
                                      clear.clear();
                                    },
                                    child: Text(
                                      'Hello!',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  height: 40,
                                  width: 200,
                                  child: Text(
                                    '$nive',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),

                                   ),
                                  ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 80,
                        width: 40,
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: sizeHeight * 0.07,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Family Members",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.teal,
                    size: 35,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                // padding: EdgeInsets.all(15.0),
                height: sizeHeight * 0.74,
                width: sizeWidth,
                child: GridView.builder(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 7),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 11,
                        mainAxisSpacing: 6,
                        childAspectRatio: 1.63),
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.teal.shade50,
                        child: Column(
                          children: [
                            Text(
                              headings[index],
                              style: TextStyle(color: Colors.teal.shade400),
                            ),
                            Expanded(child: Image.asset(images[index])),
                          ],
                        ),
                        // elevation: 5,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
