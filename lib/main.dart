import 'package:flutter/material.dart';
import 'package:google/LoginPage/Login.dart';
import 'package:google/treepage/famtree3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal[200]
      ),
      home: FamTree3(),
      debugShowCheckedModeBanner: false,
    );
  }
}
