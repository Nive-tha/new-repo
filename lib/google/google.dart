import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleandfacebook/google/google_display.dart';

class Google extends StatefulWidget {
  @override
  _GoogleState createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
  // var user1 = FirebaseAuth.instance.currentUser;
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
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GoogleDisplayPage(
                // userDetails: user1,
                )));
    // Once signed in, return the UserCredential
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
