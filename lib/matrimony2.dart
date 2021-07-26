import 'package:flutter/material.dart';
import 'package:google/matrimony3.dart';
import 'package:select_form_field/select_form_field.dart';

import 'matrimony1.dart';

// ignore: must_be_immutable
class Matrimony2 extends StatefulWidget {
  @override
  Matrimony2State createState() => Matrimony2State();
}

class Matrimony2State extends State<Matrimony2> {
  final List<Map<String, dynamic>> _rel = [
    {
      'value': '',
      'label': '',
    },
    {
      'value': '',
      'label': '',
    },
    {
      'value': '',
      'label': '',
    },
  ];
  final List<Map<String, dynamic>> mar = [
    {
      'value': '',
      'label': '',
    },
    {
      'value': '',
      'label': '',
    },
  ];
  final List<Map<String, dynamic>> _items = [
    {
      'value': '',
      'label': '',
      // 'icon': Icon(Icons.stop),
    },
    {
      'value': '',
      'label': '',
      // 'icon': Icon(Icons.fiber_manual_record),
      // 'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': '',
      'label': '',
      // 'enable': false,
      // 'icon': Icon(Icons.grade),
    },
  ];
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    var bottom = kBottomNavigationBarHeight;
    // var sizeOrientation = MediaQuery.of(context).orientation;
    // print(sizeOrientation);
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
                            Navigator.pop(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new Matrimony1()));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Matrimony',
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
                                hintText: "    Caste",
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
                                hintText: "    Subcaste",
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
                              hintText: "    Height",
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
                              hintText: "    Weight",
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
                              hintText: "    BodyType",
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
                              hintText: "    Complexion",
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
                              hintText: "    AnyDisability",
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
                                          new Matrimony3()));
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
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
