import 'package:flutter/material.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:google/sliderpg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shimmer/shimmer.dart';

class Log extends StatefulWidget {
  @override
  _LogState createState() => _LogState();
}

class _LogState extends State<Log> {
  var selectPage;
  void initState() {
    super.initState();

    _mockCheckForSession().whenComplete(
      () => Future.delayed(Duration(milliseconds: 3000), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                selectPage == null ? CustomIndicator() : MyHomePage()));
      }),
    );
  }

  Future choosingPageHere() async {}
  Future _mockCheckForSession() async {
    var shared = await SharedPreferences.getInstance();
    var gotFromShared = shared.getStringList('pic');
    setState(() {
      selectPage = gotFromShared![0];
    });
    print(selectPage);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Container(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // Opacity(
                //   opacity: 0.5,
                //   child: Image.asset('assests/images/tree.jpg'),
                // ),
                Shimmer.fromColors(
                    period: Duration(milliseconds: 1500),
                    baseColor: Colors.white,
                    highlightColor: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text("PARAMBARA",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Pacifico',
                          )),
                    )),
              ],
            ),
          ),
        ));
  }
}
