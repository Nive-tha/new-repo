import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google/familytourplan/familytourplan.dart';

class JobPostingRequest extends StatefulWidget {
  const JobPostingRequest({Key? key}) : super(key: key);

  @override
  _JobPostingRequestState createState() => _JobPostingRequestState();
}

class _JobPostingRequestState extends State<JobPostingRequest> {
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
              color: Colors.teal,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                                    prefixIcon: Icon(Icons.person),
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
                                    hintText: "   Requester name",
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
                                    hintText: "   Posting Date",
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
                                        Icon(Icons.supervised_user_circle),
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
                                    hintText: "   Company name",
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
                                    hintText: "   Position title",
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
                                    hintText: "   Number of Position",
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
                                    hintText: "   Position End Date",
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
                            width: sizeWidth,
                            height: 100,
                            padding: EdgeInsets.only(left: 28, right: 28),
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.elliptical(15, 15),
                                ),
                              ),
                              child: TextFormField(
                                  // maxLines: 3,
                                  // maxLength: 10,

                                  // controller: username,
                                  decoration: InputDecoration(
                                      // prefixIcon: Icon(Icons.person),
                                      // filled: true,
                                      // fillColor: Colors.white,
                                      border: InputBorder.none,
                                      // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                      // enabledBorder: OutlineInputBorder(
                                      //   borderRadius:
                                      //       BorderRadius.all(Radius.circular(30.0)),
                                      //   borderSide: BorderSide(
                                      //       color: Colors.teal.shade50, width: 1),
                                      // ),
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderRadius:
                                      //       BorderRadius.all(Radius.circular(40.0)),
                                      //   borderSide: BorderSide(color: Colors.teal),
                                      // ),
                                      hintText: "   Job Description",
                                      hintStyle: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 15,
                                        // fontWeight: FontWeight.bold,
                                      ))),
                            ),
                          ),
                          TextButton(
                            child: Text('next'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FamilyTourPlan(),
                                ),
                              );
                            },
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
