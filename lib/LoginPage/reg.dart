import 'package:flutter/material.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:google/LoginPage/Mail.dart';
import 'package:google/tabspages/homescreen.dart';

class Reg extends StatefulWidget {
  @override
  _RegState createState() => _RegState();
}

class _RegState extends State<Reg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          Image.asset('assets/Welcome.png'),
          
          Padding(
            padding: const EdgeInsets.only(top: 260, left: 60),
            child: Text(
              'Thank You! Stay Connected',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[400],
                  fontSize: 20.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 270, left: 75),
            child: Text(
              ' \n \n Stay connected with your family \n         amid  your busy life',
              style: TextStyle(color: Colors.blue[400], fontSize: 15.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 380, left: 140),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new LandingPage()));
              },
              child: Text('Next'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue.shade400),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
            ),
          ),
        ],
      ),
    ));
  }
}
