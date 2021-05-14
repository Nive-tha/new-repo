import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parampara_login_reg/register.dart';

import 'main.dart';

class Landing extends StatefulWidget {
  Landing({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to parambara"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Text("Login"),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text("Register"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
