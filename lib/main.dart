import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googleandfacebook/EVENTS%20ALL%20PAGES/my_events_single.dart';
import 'package:googleandfacebook/startingpage/start.dart';
import 'EVENTS ALL PAGES/my_events_form.dart';
import 'SplashScreeen/splashscreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: Colors.teal.shade300,
      ),
      home: Log(),
    );
  }
}

class Homes extends StatefulWidget {
  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              StartingPage(),
            ],
          ),
        ),
      ),
    );
  }
}
