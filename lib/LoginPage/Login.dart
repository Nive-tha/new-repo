import 'package:flutter/material.dart';
import 'package:google/sliderpg.dart';

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
  void initState() {
    super.initState();

    _mockCheckForSession();
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 6000), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => CustomIndicator()));
    });

    return true;
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
