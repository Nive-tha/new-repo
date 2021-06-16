import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:google/LoginPage/Mail.dart';
import 'package:google/matrimony2.dart';
import 'package:google/screens/home_screen.dart';
import 'package:google/screens/sign_in_screen.dart';
import 'package:google/tabspages/homescreen.dart';
import 'package:google/treeviewpagecreation/treeview.dart';
import 'package:google/widgets/fb_sign_in_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginPage/Login.dart';
import 'LoginPage/tabs.dart';
import 'Useraccount.dart';
import 'jobportal/job.dart';
import 'matrimony1.dart';

void main() async {
  runApp(
    MyApp(),
  );
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
      debugShowCheckedModeBanner: false,
    );
  }
}
