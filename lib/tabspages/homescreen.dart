import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List images = [
    'images/wedding.png',
    'images/1622479960731.JPEG',
    'images/1622479961107.JPEG',
    'images/1622479961581.JPEG',
    'images/1622479962292.JPEG',
    'images/1622479963574.JPEG',
    'images/1622479964976.JPEG',
    'images/1622479965520.JPEG',
    'images/1622479966165.JPEG',
    'images/1622479966165.JPEG'
  ];
  List headings = [
    'Matrimony',
    'Job Portal',
    'Family Tour Plan',
    'Events',
    'Image Gallery',
    'Calender',
    'Blood Donate',
    'Calls',
    'Health Tips',
    'Cooking Tips'
  ];
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeOrientation = MediaQuery.of(context).orientation;
    print(sizeOrientation);
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      body: Container(
        child: Column(
          children: [
            Container(
              height: sizeHeight * 0.19,
              width: sizeWidth,
              padding: EdgeInsets.only(top: 40, left: 15, right: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(color: Colors.red),
                            child: Image.asset('images/wedding.png'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            child: Column(
                              children: [
                                Text(
                                  'Hello!',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 5),
                                Text('James',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 80,
                        width: 40,
                        child: Icon(
                          Icons.notification_important_sharp,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: sizeHeight * 0.07,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Here",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
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
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                // padding: EdgeInsets.all(15.0),
                height: sizeHeight * 0.74,
                width: sizeWidth,
                child: GridView.builder(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 7),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 11,
                        mainAxisSpacing: 6,
                        childAspectRatio: 1.63),
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.teal.shade50,
                        child: Column(
                          children: [
                            Text(
                              headings[index],
                              style: TextStyle(color: Colors.teal.shade400),
                            ),
                            Expanded(child: Image.asset(images[index])),
                          ],
                        ),
                        // elevation: 5,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
