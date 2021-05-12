import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleandfacebook/google/google_display.dart';
import 'package:googleandfacebook/register_page/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Google extends StatefulWidget {
  @override
  _GoogleState createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
  String setNameGoogle = '';
  var keptUser = "prince";
  var keptUser1 = "pravin";
  var keptUser2 = "Prince Rathe";
  var keptUser3 = "Pravin Dev";
  var keptUser4 = "PravinDev";
  var keptUser5 = "PrinceRathe";
  var user1 = FirebaseAuth.instance.currentUser;
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    FirebaseAuth.instance.signInWithCredential(credential);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => GoogleDisplayPage(
    //             // userDetails: user1,
    //             )));
    // Once signed in, return the UserCredential

    var user_name = user1.displayName;
    print(user1.displayName);
    if (keptUser2 == user_name || keptUser3 == user_name) {
      print(user_name);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegisterPage()));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('hello'),
        ),
      );
    }
    setString();
  }

  Future<bool> setString() async {
    SharedPreferences set = await SharedPreferences.getInstance();
    return await set.setString(setNameGoogle, user1.displayName);
  }

  // logOut() async {
  //   setState(() {
  //     final user1 = '';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
            Container(
              child: ElevatedButton(
                onPressed: signInWithGoogle,
                child: Text('google'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
