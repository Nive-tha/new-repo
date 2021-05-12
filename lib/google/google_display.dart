import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleandfacebook/google/google.dart';

class GoogleDisplayPage extends StatefulWidget {
  final userDetails;

  const GoogleDisplayPage({Key key, this.userDetails}) : super(key: key);
  @override
  _GoogleDisplayPageState createState() => _GoogleDisplayPageState();
}

class _GoogleDisplayPageState extends State<GoogleDisplayPage> {
  var myName = FirebaseAuth.instance.currentUser;
  logOut() async {
    setState(() {
      GoogleSignIn().signOut();
      // FirebaseAuth.instance.signOut();
      Navigator.pop(context, MaterialPageRoute(builder: (context) => Google()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // var myName = widget.userDetails;

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.blue,
                  backgroundImage: NetworkImage(myName.photoURL),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      myName.displayName,
                    ),
                    Text(myName.email),
                    // Text(myName.phoneNumber),
                    Text(myName.uid),

                    Container(
                      child: TextButton(
                        onPressed: logOut,
                        child: Text('logout'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
