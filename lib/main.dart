import 'package:flutter/material.dart';
import 'package:google/LoginPage/Login.dart';
import 'package:google/mappage.dart';
import 'package:google/tabspages/home.dart';
import 'package:google/treepage/tree1.dart';

import 'LoginPage/contactdetail.dart';
import 'LoginPage/professionaldetails.dart';
import 'newlog.dart';
import 'package:google/BloodDonationPage/BloodDonation1.dart';
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
      home: Log(),
      debugShowCheckedModeBanner: false,
    );
  }
}
