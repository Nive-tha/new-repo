import 'package:flutter/material.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:google/treeviewpagecreation/treeview.dart';

import 'personal.dart';

class FatherDetails extends StatefulWidget {
  @override
  _FatherDetailsState createState() => _FatherDetailsState();
}

class _FatherDetailsState extends State<FatherDetails> {
  bool alive = false;
  var value1;
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        height: sizeHeight,
        width: sizeWidth,
        child: Column(
          children: [
            Container(
              height: sizeHeight * 0.14,
              width: sizeWidth,
              color: Colors.teal,
              child: Center(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      (Radius.circular(40)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 9.0),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.teal,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new LandingPage()));
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Text(
                          'Father Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: sizeHeight * 0.85,
                width: sizeWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 15, bottom: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Please enter Father details',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: sizeWidth * 0.9,
                        child: CustomFormField1(
                          hintText: 'Name',
                          icon: Icon(
                            Icons.person,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: sizeWidth * 0.9,
                        child: CustomFormField1(
                          icon: Icon(
                            Icons.people,
                            color: Colors.grey.shade400,
                          ),
                          hintText: "Family Name",
                        ),
                      ),
                      Container(
                        height: 70,
                        width: sizeWidth * 0.9,
                        child: CustomFormField1(
                          hintText: "Email",
                          icon: Icon(
                            Icons.email,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: sizeWidth * 0.45,
                            child: CustomFormField1(
                              hintText: "DOB",
                              icon: Icon(
                                Icons.calendar_today_rounded,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: sizeWidth * 0.45,
                            child: Row(
                              children: [
                                Checkbox(value: alive, onChanged: null),
                                Text(
                                  'if died',
                                  style: TextStyle(color: Colors.teal),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 70,
                        width: sizeWidth * 0.9,
                        child: CustomFormField1(
                          icon: Icon(
                            Icons.location_city,
                            color: Colors.grey.shade400,
                          ),
                          hintText: "Location",
                        ),
                      ),
                      Container(
                        height: 70,
                        width: sizeWidth * 0.9,
                        child: CustomFormField1(
                          icon: Icon(
                            Icons.person,
                            color: Colors.grey.shade400,
                          ),
                          hintText: 'Relationship',
                        ),
                      ),
                      Container(
                        height: 70,
                        width: sizeWidth * 0.9,
                        child: CustomFormField1(
                          icon: Icon(
                            Icons.camera,
                            color: Colors.grey.shade400,
                          ),
                          hintText: 'Upload Picture',
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: sizeWidth * 0.350,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          'Submit',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )),
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

class CustomFormField1 extends StatefulWidget {
  CustomFormField1({this.icon, this.hintText});
  final icon;
  final hintText;
  @override
  State<StatefulWidget> createState() {
    return CustomFormField1State();
  }
}

class CustomFormField1State extends State<CustomFormField1> {
  @override
  Widget build(BuildContext context) {
    var icon1 = widget.icon;
    var hintText1 = widget.hintText;
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText1,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          prefixIcon: icon1,
          fillColor: Colors.teal.shade50,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal.shade50),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal.shade50),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
