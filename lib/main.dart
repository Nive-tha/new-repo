import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google/screens/home_screen.dart';
import 'package:google/screens/sign_in_screen.dart';
import 'package:google/widgets/fb_sign_in_button.dart';

import 'LoginPage/Login.dart';
import 'LoginPage/tabs.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: Log(),
    );
  }
}