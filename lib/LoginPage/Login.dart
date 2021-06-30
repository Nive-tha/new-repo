import 'package:flutter/material.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:google/sliderpg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shimmer/shimmer.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Log extends StatefulWidget {
  @override
  _LogState createState() => _LogState();
}

class _LogState extends State<Log> {
  var selectHere;
  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 50000), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => CustomIndicator()));
    });

    return true;
  }

  void initState() {
    super.initState();

    _mockCheckForSession();
    selectingHere().whenComplete(
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                selectHere == null ? CustomIndicator() : MyHomePage()),
      ),
    );
  }

  Future selectingHere() async {
    var shared = await SharedPreferences.getInstance();
    setState(() {
      selectHere = shared.getStringList('pic');
    });
    print(selectHere);
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
                    period: Duration(milliseconds: 50000),
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
