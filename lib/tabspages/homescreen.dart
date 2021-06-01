import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({this.googleLanding, this.faceBookLanding, this.emptyLanding});
  var faceBookLanding;
  var googleLanding;
  var emptyLanding;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSigningOut = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    save();

  }

  save() async {
    SharedPreferences get = await SharedPreferences.getInstance();
    List<String> prefer = (get.getStringList('a'))!;
    print(prefer);
    print(prefer.length);
    print(prefer[0]);
    print(prefer[1]);

    username.text= prefer[0];
    get.clear();
  }

  var profileData;
  var facebookLogin = FacebookLogin();
  bool isLoggedIn = false;

  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }

  var username = TextEditingController();
  var email = TextEditingController();

  List images = [
    'assets/wedding.png',
    'assets/1622479960731.JPEG',
    'assets/1622479961107.JPEG',
    'assets/1622479961581.JPEG',
    'assets/1622479962292.JPEG',
    'assets/1622479963574.JPEG',
    'assets/1622479964976.JPEG',
    'assets/1622479965520.JPEG',
    'assets/1622479966165.JPEG',
    'assets/1622479966165.JPEG'
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
      // if (widget.faceBookLanding == null && widget.googleLanding == null) {
      //   print("hello empty");
      //   // print(widget.faceBookLanding);
      //
      //   username.text = widget.emptyLanding;
      //   email.text= widget.emptyLanding;
      // } else if (widget.faceBookLanding == null && widget.emptyLanding == null) {
      //   print("hello google");
      //
      //   username.text = widget.googleLanding.displayName;
      //   email.text= widget.googleLanding.email;
      // } else if (widget.emptyLanding == null && widget.googleLanding == null) {
      //   print("hello facebook");
      //   print(widget.faceBookLanding);
      //
      //   username.text= widget.faceBookLanding['name'];
      //   email.text = widget.faceBookLanding['email'];
      // } else {
      //   print("nothing worked");
      // }

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
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(color: Colors.red),
                            child: Image.asset('images/wedding.png'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            child: Column(
                              children: [
                                Text(
                                  'Hello!',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 5),
                                TextField(
                                  controller: username,

                                  enabled: false,
                                  decoration: InputDecoration(
                                      border: InputBorder.none),

                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 80,
                        width: 40,
                        child: Icon(
                          Icons.notification_important_sharp,
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
                  hintText: "Search Here",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
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
