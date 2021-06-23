import 'package:flutter/material.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:google/matrimony2.dart';
import 'package:select_form_field/select_form_field.dart';

// ignore: must_be_immutable
class Matrimony1 extends StatefulWidget {
  @override
  Matrimony1State createState() => Matrimony1State();
}

class Matrimony1State extends State<Matrimony1> {
  final List<Map<String, dynamic>> _rel = [
    {
      'value': 'Hindu',
      'label': 'Hindu',
    },
    {
      'value': 'Muslim',
      'label': 'Muslim',
    },
    {
      'value': 'Christian',
      'label': 'Christian',
    },
  ];
  final List<Map<String, dynamic>> mar = [
    {
      'value': 'Single',
      'label': 'Single',
    },
    {
      'value': 'Married',
      'label': 'Married',
    },
  ];
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Male',
      'label': 'Male',
      // 'icon': Icon(Icons.stop),
    },
    {
      'value': 'Female',
      'label': 'Female',
      // 'icon': Icon(Icons.fiber_manual_record),
      // 'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': 'others',
      'label': 'others',
      // 'enable': false,
      // 'icon': Icon(Icons.grade),
    },
  ];

  @override
  Widget build(BuildContext context) {
    RangeValues _currentRangeValues = const RangeValues(40, 80);

    var rating;
    // Slider(
    //   value: rating,
    //   onChanged: (newRating) {
    //     setState(() {
    //       rating = newRating;
    //     });
    //   },
    //   divisions: 4,
    //   label: "$rating",
    // );
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    // var sizeOrientation = MediaQuery.of(context).orientation;
    // print(sizeOrientation);
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        child: Column(
          children: [
            Container(
              height: sizeHeight * 0.07,
              // width: sizeWidth,
              // padding: EdgeInsets.only(top: 40, left: 15, right: 18),
            ),
            Container(
              height: sizeHeight * 0.10,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Matrimony",
                  hintStyle: TextStyle(
                    color: Colors.teal,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: IconButton(
                    icon: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new LandingPage()));
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                      ),
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
                  image: DecorationImage(
                    image: AssetImage("assets/matrimony.jpeg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                height: sizeHeight * 0.74,
                width: sizeWidth,
                child: SingleChildScrollView(
                  child: Form(
                      child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        width: 350,
                        child: TextFormField(
                            // controller: username,
                            decoration: InputDecoration(
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
                                hintText: "   Searching groom for whom?",
                                hintStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold,
                                ))),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 350,
                        child: TextFormField(
                            // controller: username,
                            decoration: InputDecoration(
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
                                hintText: "    Your Daughter's name",
                                hintStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold,
                                ))),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 350,
                        child: SelectFormField(
                          // icon: Icon(Icons.people, color: Colors.black),
                          // labelText: 'Gender',
                          changeIcon: true,
                          dialogTitle: 'Pick a item',
                          dialogCancelBtn: 'CANCEL',
                          enableSearch: true,
                          dialogSearchHint: 'Search item',
                          items: _items,
                          decoration: InputDecoration(
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
                              hintText: "    Gender",
                              hintStyle: TextStyle(
                                color: Colors.teal,
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 350,
                        child: TextFormField(
                            // controller: username,
                            decoration: InputDecoration(
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
                                hintText: "    Date of Birth",
                                hintStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold,
                                ))),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 350,
                        child: TextFormField(
                            // controller: username,
                            decoration: InputDecoration(
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
                                hintText: "    Mobile Number",
                                hintStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold,
                                ))),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 350,
                        child: SelectFormField(
                          // icon: Icon(Icons.people, color: Colors.black),
                          // labelText: 'Gender',
                          changeIcon: true,
                          dialogTitle: 'Pick a item',
                          dialogCancelBtn: 'CANCEL',
                          enableSearch: true,
                          dialogSearchHint: 'Search item',
                          items: mar,
                          decoration: InputDecoration(
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
                              hintText: "    Marital Status",
                              hintStyle: TextStyle(
                                color: Colors.teal,
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 350,
                        child: SelectFormField(
                          // icon: Icon(Icons.people, color: Colors.black),
                          // labelText: 'Gender',
                          changeIcon: true,
                          dialogTitle: 'Pick a item',
                          dialogCancelBtn: 'CANCEL',
                          enableSearch: true,
                          dialogSearchHint: 'Search item',
                          items: _rel,
                          decoration: InputDecoration(
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
                              hintText: "    Religion",
                              hintStyle: TextStyle(
                                color: Colors.teal,
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      SizedBox(height: 20),

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
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new Matrimony2()));
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      // ElevatedButton(
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (BuildContext context) =>
                      //                   Matrimony2()));
                      //     },
                      //     child: Text("Next"))
                    ],
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
