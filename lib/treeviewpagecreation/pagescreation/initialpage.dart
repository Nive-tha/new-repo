import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google/treeviewpagecreation/pagescreation/contact.dart';
import 'package:google/treeviewpagecreation/pagescreation/personal.dart';
import 'package:google/treeviewpagecreation/pagescreation/professional.dart';

class InitialDisplayPage extends StatefulWidget {
  @override
  _InitialDisplayPageState createState() => _InitialDisplayPageState();
}

class _InitialDisplayPageState extends State<InitialDisplayPage> {
  var selected2;
  var color0;
  var color1;
  var color2;
  var val;
  var color = Colors.teal.shade100;
  var containerValue;
  var containerValue1;
  List heading = [
    "Add Personal Details",
    "Add Contact Details",
    "Add Professional Details"
  ];
  GlobalKey isSelected = GlobalKey();
  var index;
  var selectedIndex;
  List pages = [Personal(), Contact(), Professional()];
  double selectedContainerHeight1 = 3;
  double selectedContainerHeight2 = 3;
  double selectedContainerHeight3 = 3;
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    var bottom = MediaQuery.of(context).padding.bottom;
    var top = MediaQuery.of(context).padding.top;
    print(bottom);
    print(top);
    print(25);
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        height: sizeHeight,
        width: sizeWidth,
        child: Column(
          children: [
            Container(
              height: (sizeHeight) * 0.14,
              width: sizeWidth,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 50,
                    width: sizeWidth,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 12, bottom: 8),
                      child: Text(
                        heading[0],
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              color: Colors.teal,
            ),
            Container(
              height: (sizeHeight) * 0.86,
              width: sizeWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: (sizeHeight * 0.7869) * 0.08,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedContainerHeight3 = 2;
                                              selectedContainerHeight1 = 3;
                                              selectedContainerHeight2 = 2;
                                              containerValue1 = 0;
                                              color0 = Colors.teal;
                                            });
                                          },
                                          child: Text(
                                            'Personal',
                                            style: TextStyle(color: color0),
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: sizeWidth * 1 / 3,
                                        height: selectedContainerHeight1,
                                        color: Colors.teal,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              color1 = Colors.teal;
                                              selectedContainerHeight3 = 2;
                                              selectedContainerHeight1 = 2;
                                              selectedContainerHeight2 = 3;
                                            });
                                          },
                                          child: Text(
                                            'Contact',
                                            style: TextStyle(color: color1),
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: sizeWidth * 1 / 3,
                                        height: selectedContainerHeight2,
                                        color: Colors.teal,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            color2 = Colors.teal;
                                            selectedContainerHeight3 = 3;
                                            selectedContainerHeight1 = 2;
                                            selectedContainerHeight2 = 2;
                                          });
                                        },
                                        child: Text(
                                          'Professional',
                                          style: TextStyle(
                                            color: color2,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: sizeWidth * 1 / 3,
                                        height: selectedContainerHeight3,
                                        color: Colors.teal,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            height: (sizeHeight * 0.7869) * 0.92,
                            // color: Colors.amber,
                            child: GestureDetector(
                              excludeFromSemantics: true,
                              dragStartBehavior: DragStartBehavior.start,
                              onTap: () {
                                print(val);
                                setState(() {
                                  val = val;
                                });
                              },
                              child: PageView.builder(
                                itemCount: pages.length,
                                itemBuilder: (
                                  context,
                                  index,
                                ) {
                                  val = index;
                                  print(val);
                                  print(204);

                                  return pages[index];
                                },
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
