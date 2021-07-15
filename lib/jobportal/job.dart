import 'package:flutter/material.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:google/jobportal/jobpostingrequest.dart';
import 'package:google/jobportal/jobsearch.dart';
import 'package:google/tabspages/homescreen.dart';

class Job extends StatefulWidget {
  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var bottom = kBottomNavigationBarHeight;
    print(bottom);
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: ((height - bottom) * 0.15),
              width: width,
              color: Colors.teal,
              child: Center(
                child: Container(
                  height: ((height - bottom) * 0.15) * 0.5,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
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
                                        new HomeScreen()));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Job Portal',
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
            Container(
              height: ((height - bottom) * 0.85),
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('assets/Jobpost.jpeg'),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 10, right: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobSearch()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        color: Colors.white,
                        child: Container(
                          height: ((height - bottom) * 0.85) * 0.25,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 15),
                            child: Row(
                              children: [
                                Image.asset('assets/jobbb.jpeg'),
                                SizedBox(width: 30),
                                Text(
                                  'Job Search',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 10, right: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobPostingRequest()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        color: Colors.white,
                        child: Container(
                          height: ((height - bottom) * 0.85) * 0.25,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            // color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 15),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    'Job Post',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.teal,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 50),
                                Image.asset('assets/jobb.jpeg'),
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
            // BottomNavigationBar(
            //   items: [
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.arrow_back),
            //       label: "home",
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.arrow_back),
            //       label: "home",
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
