import 'package:flutter/material.dart';

class FamilyTourPlan extends StatefulWidget {
  const FamilyTourPlan({Key? key}) : super(key: key);

  @override
  _FamilyTourPlanState createState() => _FamilyTourPlanState();
}

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
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Job Posting Request',
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
                  height: (sizeHeight - bottom) * 0.85,
                  width: sizeWidth,
                  child: SingleChildScrollView(
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
                                // controller: username,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.date_range),
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
                                    prefixIcon:
                                        Icon(Icons.format_list_numbered),
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
                                    hintText: "  ",
                                    hintStyle: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                    ))),
                          ),
                          SizedBox(height: 180),
                          Container(
                            height: 45,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Post',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
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
