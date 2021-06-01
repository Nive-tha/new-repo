import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:googleandfacebook/register_page/register_page.dart';
import 'package:googleandfacebook/startingpage/start.dart';
=======
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:google/screens/home_screen.dart';
import 'package:google/screens/sign_in_screen.dart';
import 'package:google/widgets/fb_sign_in_button.dart';
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
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
=======
      home: MyHomePage(),
>>>>>>> Stashed changes
    );
  }
}
