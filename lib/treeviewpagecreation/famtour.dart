import 'package:flutter/material.dart';

class FamTour extends StatefulWidget {
  FamTour({Key? key}) : super(key: key);

  @override
  _FamTourState createState() => _FamTourState();
}

class _FamTourState extends State<FamTour> {
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Container(
            child: Column(children: [
          Container(
            height: sizeHeight * 0.07,
          ),
          Container(
            height: sizeHeight * 0.10,
            padding: EdgeInsets.only(left: 5, right: 5),
            child: TextField(
              decoration: InputDecoration(
                hintText: "FamilyTourPlan",
                hintStyle: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(
                  Icons.arrow_back_ios_outlined,
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
          SingleChildScrollView(
            child: Expanded(
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
                            child: Column(children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 280,
                        height: 50,
                        child: TextFormField(
                            // controller: username,
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
                                hintText: "   Trip Start Date",
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
                            // controller: username,
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
                            // controller: username,
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
                            // controller: username,
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
                            // controller: username,
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
                                hintText: "  ",
                                hintStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                ))),
                      ),
                    ]))))),
          )
        ])));
  }
}
