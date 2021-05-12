import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/material.dart';
import 'package:googleandfacebook/facebook/facebook_display.dart';
import 'package:googleandfacebook/register_page/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FaceBook extends StatefulWidget {
  @override
  _FaceBookState createState() => _FaceBookState();
}

class _FaceBookState extends State<FaceBook> {
  String setNameFacebook = " ";
  var keptUser3 = "Prince Rathe";
  // var keptUser4 = "PravinDev";
  var user_name1;
  sending() {
    print(user_name1["name"]);
    if (keptUser3 == user_name1["name"]) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegisterPage()));
    } else {
      print('wrong need to change');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('hello'),
        ),
      );
    }
    sendingData();
  }

  Future<bool> sendingData() async {
    print(setNameFacebook);
    print(user_name1["name"]);
    SharedPreferences set = await SharedPreferences.getInstance();
    return await set.setString(setNameFacebook, user_name1["name"]);
  }

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
                  user_name1 = userData;
                  sending();
                  // _userObj = userData;
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             FacebookDisplay(details: userData)));
                });
              });
            });
          },
        ),
      ),
    );
  }
}
