import 'package:flutter/material.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter/services.dart';
class FamilyTourPlan extends StatefulWidget {
  @override
  _FamilyTourPlanState createState() => _FamilyTourPlanState();
}

class _FamilyTourPlanState extends State<FamilyTourPlan> {
  var tripStartDate = TextEditingController();
  var tripEndDate = TextEditingController();
  var formPlace = TextEditingController();
  var noOfTravel = TextEditingController();
  var toPlace = TextEditingController();
  var arrivalTiming = TextEditingController();
  var departureTiming = TextEditingController();
  var receiveId;
  var fam_id = TextEditingController();
  var id = TextEditingController();

  Future _read(a, b, c, d, e, f, g, h, i) async {
// print('func');

    //
    SharedPreferences prefer = await SharedPreferences.getInstance();
    receiveId = prefer.getStringList('idS');
    id.text = receiveId[0];
    fam_id.text = receiveId[1];
    print(receiveId[0]);
    print(receiveId[1]);
    final String url =
<<<<<<< HEAD
        "http://bdb62dc1e609.ngrok.io/parampara/userpersonal/tourplan";
=======
        "http://118a3e078f67.ngrok.io/parampara/userpersonal/tourplan";
>>>>>>> Malathy
    final response = await http.post(Uri.parse(url), body: {
      'id': a,
      'fam_id': b,
      'tripStartDate': c,
      'tripEndDate': d,
      'fromStart': e,
      'toend': f,
      'arrivalTime': g,
      'total': h,
      'departureTime': i,
    });
    print(response);
    print(response.body);
  }

  Future datePicking() async {
    // FocusScopeNode currentFocus = FocusScope.of(context);
    // print(currentFocus);
    // if (currentFocus.hasPrimaryFocus &&
    //     currentFocus.focusedChild != null &&
    //     currentFocus.hasFocus) {
    //   currentFocus.focusedChild.unfocus();
    //   currentFocus.unfocus();
    // }
    var today = DateTime.now();
    print(today);
    var date = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    print(date!.day);
    print(date.month);
    if (date == null) return;
    if (date != null) {
      setState(() {
        tripStartDate.text = DateFormat('yyyy/MM/dd').format(date);
        tripEndDate.text = DateFormat('yyyy/MM/dd').format(date);
      });
    }
  }

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
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Family Tour Plan',
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
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: datePicking,
                          child: Container(
                            width: 280,
                            height: 50,
                            child: TextFormField(
                                onTap: datePicking,
                                readOnly: true,
                                controller: tripStartDate,
                                decoration: InputDecoration(
                                    prefixIcon: InkWell(
                                        onTap: datePicking,
                                        child: Icon(Icons.date_range)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                          color: Colors.teal.shade50, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.0)),
                                      borderSide:
                                          BorderSide(color: Colors.teal),
                                    ),
                                    hintText: "   Trip Start Date",
                                    hintStyle: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                    ))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: datePicking,
                          child: Container(
                            width: 280,
                            height: 50,
                            child: TextFormField(
                                onTap: datePicking,
                                readOnly: true,
                                controller: tripEndDate,
                                decoration: InputDecoration(
                                    prefixIcon: InkWell(
                                        onTap: datePicking,
                                        child: Icon(Icons.date_range)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                          color: Colors.teal.shade50, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.0)),
                                      borderSide:
                                          BorderSide(color: Colors.teal),
                                    ),
                                    hintText: "   Trip End Date",
                                    hintStyle: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                    ))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 280,
                          height: 50,
                          child: TextFormField(
                              controller: formPlace,
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
                              controller: toPlace,
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
                              controller: arrivalTiming,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.timelapse),
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
                                  hintText: " Arrival timing  ",
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
                              controller: departureTiming,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.timelapse),
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
                                  hintText: " Departure timing  ",
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
                              controller: noOfTravel,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
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
                                  hintText: " Total no of travellers  ",
                                  hintStyle: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 15,
                                    // fontWeight: FontWeight.bold,
                                  ))),
                        ),
                        SizedBox(height: 40),
                        Container(
                          height: 45,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              child: Text(
                                'Post',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                SharedPreferences prefer =
                                    await SharedPreferences.getInstance();
                                receiveId = prefer.getStringList('idS');
                                id.text = receiveId[0];
                                fam_id.text = receiveId[1];
                                final String a = id.text;
                                final String b = fam_id.text;
                                final String c = tripStartDate.text;
                                final String d = tripEndDate.text;
                                final String e = formPlace.text;
                                final String f = toPlace.text;
                                final String g = arrivalTiming.text;
                                final String h = noOfTravel.text;
                                final String i = departureTiming.text;

                                _read(a, b, c, d, e, f, g, h, i);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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
