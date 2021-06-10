import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google/treeviewpagecreation/pagescreation/initialpage.dart';

class TreeView extends StatefulWidget {
  @override
  _TreeViewState createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  var appBar1 = AppBar();
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeHeight1 = MediaQuery.of(context).size.flipped;
    var sizeHeight2 = MediaQuery.of(context).size.aspectRatio;
    var sizeHeight3 = MediaQuery.of(context).orientation.index;
    var sizeWidth = MediaQuery.of(context).size.width;
    var appBarHeight = appBar1.preferredSize.height;
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var total = sizeHeight + statusBarHeight;
    print(sizeWidth);
    print(sizeHeight);
    print(sizeHeight1);
    print(sizeHeight2);
    print(sizeHeight3);
    print(appBarHeight);
    print(statusBarHeight);
    print(total);
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        child: Column(
          children: [
            Container(
              height: sizeHeight * 0.2,
              width: sizeWidth,
              child: Center(
                child: Container(
                  height: 50,
                  width: sizeWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.arrow_back_ios_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Family Tree',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.exit_to_app,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.do_not_disturb),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              color: Colors.teal,
            ),
            Container(
              height: sizeHeight * 0.73,
              width: sizeWidth,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: new OutlineButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InitialDisplayPage()));
                        },
                        child: Image.asset('assets/1622479960731.JPEG'),
                        shape: StadiumBorder(),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    Text('Add you in tree')
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
