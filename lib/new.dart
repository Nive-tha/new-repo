import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class News extends StatefulWidget {
  final String page;
  News(this.page);
  @override
  _NewsState createState() => _NewsState(page);
}

class _NewsState extends State<News> {
  String page;
  _NewsState(this.page);
  bool isLoggedIn = false;
  var profileData;
  var facebookLogin = FacebookLogin();

  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }

  _displayUserData(page) {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => News(),
    //     ));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                page['picture']['data']['url'],
              ),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          "Name: ${page['name']}",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        Text(
          "ID: ${page['id']}",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        ElevatedButton(onPressed: _logout, child: Text('logout'))
      ],
    );
  }

  _logout() async {
    await facebookLogin.logOut();
    onLoginStatusChanged(false);
    print("Logged out");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: _displayUserData(page),
        ),
      ),
    );
  }
}
