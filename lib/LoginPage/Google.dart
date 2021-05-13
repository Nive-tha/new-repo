import 'package:flutter/material.dart';
import 'package:google/screens/sign_in_screen.dart';
class Google extends StatefulWidget {
  @override
  _GoogleState createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        primarySwatch: Colors.blue,
    ),
    home: SignInScreen(),
    );
  }
}
