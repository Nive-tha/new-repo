import 'package:flutter/material.dart';
import 'package:google/BloodDonationPage/BloodDonation1.dart';
import 'package:google/calender/calender.dart';
import 'package:google/events/events.dart';
import 'package:google/familytourplan/familytourplan.dart';
import 'package:google/imagegallery.dart';
import 'package:google/jobportal/job.dart';
import 'package:google/treepage/tree1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../matrimony1.dart';

class Home1 extends StatefulWidget {
  Home1({Key? key}) : super(key: key);

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  var appbar = AppBar();
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

    var appbarHeight = appbar.preferredSize.height;
    print(appbarHeight);
    print("71");
    var bheight = kBottomNavigationBarHeight;
    var kheight = MediaQuery.of(context).padding.top;
    var sizeWidth = MediaQuery.of(context).size.width;
    var leftsize = sizeHeight - (sizeHeight - appbarHeight);
    print(leftsize);
    print(sizeHeight);
    print(74);
    print(bheight);
    print(kheight);
    print(sizeWidth);
    return Scaffold(
      appBar: appbar,
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Nivetha"),
              accountEmail: Text("nivem17@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.teal[400],
                child: Text("N"),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home1()));
              },
              leading: Image.asset('assets/homeicon.png'),
              title: Text("Home", style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home1()));
              },
              leading: Image.asset('assets/message.png'),
              title: Text("Message", style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Tree1()));
              },
              leading: Image.asset('assets/treee.png'),
              title: Text("Family Tree",
                  style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home1()));
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home1()));
              },
              leading: Image.asset('assets/accounticon.png'),
              title: Text("Account", style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home1()));
              },
              leading: Image.asset('assets/logoutt.png'),
              title: Text("Logout", style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: sizeHeight,
        child: Column(
          children: [
            Container(
              height: ((sizeHeight - (appbarHeight+kheight)) * 0.19),
              color: Colors.red,
              // child: Column(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [],
              //       ),
              //     ),
              //     SizedBox(height: 80),
              //     Container(
              //       height: 45,
              //       width: 280,
              //       child: TextFormField(
              //         decoration: InputDecoration(
              //           enabledBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(10)),
              //             borderSide: BorderSide(width: 2, color: Colors.white),
              //           ),
              //           focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(10)),
              //             borderSide: BorderSide(width: 2, color: Colors.white),
              //           ),
              //           hintText: "Search ",
              //           hintStyle: TextStyle(color: Colors.white),
              //           prefixIcon: Icon(
              //             Icons.search,
              //             color: Colors.white,
              //             size: 20,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ),
            Container(
              color: Colors.green,
              // decoration: new BoxDecoration(
              //   // color: Colors.red,
              //   image: new DecorationImage(
              //     image: ExactAssetImage('assets/back.png'),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              height:((sizeHeight - (appbarHeight+kheight)) * 0.81),
              // child: Expanded(
              //   child: GridView.builder(
              //       padding: EdgeInsets.only(left: 10, right: 10, top: 7),
              //       itemCount: 10,
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 2,
              //           crossAxisSpacing: 11,
              //           mainAxisSpacing: 6,
              //           childAspectRatio: 1.0),
              //       itemBuilder: (context, index) {
              //         return Container(
              //           child: Column(
              //             children: [
              //               Expanded(
              //                 child: Container(
              //                   decoration: BoxDecoration(
              //                       color: Colors.white,
              //                       borderRadius: BorderRadius.only(
              //                           topLeft: Radius.circular(5),
              //                           topRight: Radius.circular(5)),
              //                       border: Border.all(color: Colors.white)),
              //                   child: Center(
              //                     child: InkWell(
              //                         onTap: () {
              //                           Navigator.push(
              //                               context,
              //                               MaterialPageRoute(
              //                                   builder: (context) =>
              //                                       movingpages[index]));
              //                         },
              //                         child: Image.asset(
              //                           images[index],
              //                           height: 50,
              //                           width: 50,
              //                         )),
              //                   ),
              //                 ),
              //               ),
              //               Container(
              //                 decoration: BoxDecoration(
              //                     color: Colors.cyan[900],
              //                     borderRadius: BorderRadius.only(
              //                         bottomLeft: Radius.circular(5),
              //                         bottomRight: Radius.circular(5)),
              //                     border: Border.all(color: Colors.white)),
              //                 height: 60,
              //                 child: Center(
              //                   child: Text(
              //                     headings[index],
              //                     style: TextStyle(color: Colors.white),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           // elevation: 5,
              //         );
              //       }),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
