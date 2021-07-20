import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googleandfacebook/register_page/register_page.dart';
import 'package:googleandfacebook/startingpage/start.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homes(),
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
