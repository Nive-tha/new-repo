import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/material.dart';
import 'package:googleandfacebook/facebook/facebook_display.dart';

class FaceBook extends StatefulWidget {
  @override
  _FaceBookState createState() => _FaceBookState();
}

class _FaceBookState extends State<FaceBook> {
  bool _isLoggedIn = false;
  // Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          // child: _isLoggedIn
          //     ? Column(
          //         children: [
          //           // Image.network(_userObj["picture"]["data"]["url"]),
          //           // Text(_userObj["name"]),
          //           // Text(_userObj["email"]),
          //           // Text(_userObj['id']),
          //           // // Text(_userObj['full_name']),
          //           TextButton(
          //               onPressed: () {
          //                 FacebookAuth.instance.logOut().then((value) {
          //                   setState(() {
          //                     _isLoggedIn = false;
          //                     // _userObj = {};
          //                   });
          //                 });
          //               },
          //               child: Text("Logout"))
          //         ],
          //       )
          //     :
          Center(
        child: ElevatedButton(
          child: Text("Facebook"),
          onPressed: () async {
            FacebookAuth.instance
                .login(permissions: ["public_profile", "email"]).then((value) {
              FacebookAuth.instance.getUserData().then((userData) {
                setState(() {
                  _isLoggedIn = true;
                  // _userObj = userData;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FacebookDisplay(details: userData)));
                });
              });
            });
          },
        ),
      ),
    );
  }
}
