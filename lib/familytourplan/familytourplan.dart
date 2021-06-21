import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Useraccount.dart';

class FamilyTourPlan extends StatefulWidget {
  const FamilyTourPlan({Key? key}) : super(key: key);

  @override
  _FamilyTourPlanState createState() => _FamilyTourPlanState();
}

var receiveId;
var familyId;
var user_Id;

@override
void initState() {
  // ignore: todo
  // TODO: implement initState
  initState();
  saveid();
}

saveid() async {
  SharedPreferences get = await SharedPreferences.getInstance();
  receiveId = get.getStringList('idS');
  familyId = receiveId[0];
  user_Id = receiveId[1];
  print(user_Id);
  print(familyId);
  famid.text = familyId;
  id.text = user_Id;
}

var tripStart = TextEditingController();
var tripEnd = TextEditingController();
var fromStart = TextEditingController();
var toEnd = TextEditingController();
var arrivalTime = TextEditingController();
var totaL = TextEditingController();
var departure = TextEditingController();
var famid = TextEditingController();
var id = TextEditingController();
late final DateTime selectedDate;
late final ValueChanged<DateTime> selectDate;

Future _posT(a, b, c, d, e, f, g, k, i) async {
// print('func');

  //

  final String url =
      "http://8d4bba7d1b46.ngrok.io/parampara/userpersonal/tourplan";

  final response = await http.post(Uri.parse(url), body: {
    'id': a,
    'family_id': b,
    'tripStartDate': c,
    'tripEndDate': d,
    'fromstart': e,
    'toend': f,
    'arrivalTime': g,
    'total': k,
    "departureTime": i,
  });
  print(response);
  print(response.body);
  var receivedDetails = json.decode(response.body);
  print(receivedDetails);
}

// Future<void> _selectDate(BuildContext context) async {
//   final DateTime picked = (await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: new DateTime(1970, 8),
//       lastDate: new DateTime(2101)))!;
//   if (picked != null && picked != selectedDate) selectDate(picked);
// }
class _FamilyTourPlanState extends State<FamilyTourPlan> {
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    var bottom = kBottomNavigationBarHeight;

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        child: Column(
          children: [
            Container(
              height: ((sizeHeight - bottom) * 0.15),
              width: sizeWidth,
              child: Center(
                child: Container(
                  height: ((sizeHeight - bottom) * 0.15) * 0.5,
                  width: sizeWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          color: Colors.teal,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new LandingPage()));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Family Tour plan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.teal),
                      )
                    ],
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
                  image: DecorationImage(
                    image: AssetImage("assets/matrimony.jpeg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                height: (sizeHeight - bottom) * 0.85,
                width: sizeWidth,
                child: Form(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 280,
                        height: 50,
                        child: TextFormField(
                            controller: tripStart,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.date_range),
                                filled: true,
                                fillColor: Colors.white,
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: Colors.teal.shade50, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                labelText: "   Trip Start Date",
                                hintStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 280,
                        height: 50,
                        child: TextFormField(
                            controller: tripEnd,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.date_range),
                                filled: true,
                                fillColor: Colors.white,
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: Colors.teal.shade50, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                hintText: "   Trip End Date",
                                hintStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 280,
                        height: 50,
                        child: TextFormField(
                            controller: fromStart,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.title),
                                filled: true,
                                fillColor: Colors.white,
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: Colors.teal.shade50, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                hintText: "   From place",
                                hintStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 280,
                        height: 50,
                        child: TextFormField(
                            controller: toEnd,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.format_list_numbered),
                                filled: true,
                                fillColor: Colors.white,
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: Colors.teal.shade50, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                hintText: "   To place",
                                hintStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 280,
                        height: 50,
                        child: TextFormField(
                            controller: arrivalTime,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.date_range),
                                filled: true,
                                fillColor: Colors.white,
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: Colors.teal.shade50, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                hintText: "Arrival Timing",
                                hintStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 280,
                        height: 50,
                        child: TextFormField(
                            controller: departure,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.date_range),
                                filled: true,
                                fillColor: Colors.white,
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: Colors.teal.shade50, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                hintText: "Departure Timing",
                                hintStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 280,
                        height: 50,
                        child: TextFormField(
                            controller: totaL,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.date_range),
                                filled: true,
                                fillColor: Colors.white,
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: Colors.teal.shade50, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                hintText: "Total no of travellers",
                                hintStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                ))),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 45,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                final String a = id.text;
                                final String b = famid.text;
                                final String c = tripStart.text;
                                final String d = tripEnd.text;
                                final String e = fromStart.text;
                                final String f = toEnd.text;
                                final String g = arrivalTime.text;
                                final String k = departure.text;
                                final String i = totaL.text;
                                _posT(a, b, c, d, e, f, g, k, i);
                                saveid();
                              },
                              child: Text(
                                'Post',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
