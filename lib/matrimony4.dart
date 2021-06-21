import 'package:flutter/material.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:select_form_field/select_form_field.dart';

import 'matrimony3.dart';

// ignore: must_be_immutable
class Matrimony4 extends StatefulWidget {
  @override
  Matrimony4State createState() => Matrimony4State();
}

class Matrimony4State extends State<Matrimony4> {
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
                              hintText: "    Education",
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
                              hintText: "    Employeed",
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
                              hintText: "    Occupation",
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
                              hintText: "    AnnualIncome",
                              hintStyle: TextStyle(
                                color: Colors.teal,
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Add Photos",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      // GridView.count(
                      //   crossAxisCount: 2,
                      //   children: [Card()],
                      // )
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
