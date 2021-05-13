import 'package:flutter/material.dart';
import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google/new.dart';
import 'package:google/res/custom_colors.dart';
import 'package:google/utils/authentication.dart';
// ignore: unused_import
import 'package:google/widgets/fb_sign_in_button.dart';
import 'package:google/widgets/google_sign_in_button.dart';
import 'package:google/widgets/register.dart';
import 'package:google/widgets/resgister_new.dart';
import 'package:http/http.dart' as http;

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isLoggedIn = false;
  //
  var profileData;
  var facebookLogin = FacebookLogin();

  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }

  void initiateFacebookLogin() async {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => SignInScreen()));
    var facebookLoginResult = await facebookLogin.logIn(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        var graphResponse = await http.get(Uri.parse(
            'https://graph.facebook.com/v2.12/me?fields=name,id,first_name,last_name,email,picture.height(200)&access_token=${facebookLoginResult.accessToken.token}'));

        var profile = json.decode(graphResponse.body);
        print(profile.toString());


        onLoginStatusChanged(true, profileData: profile);
        // sr
        //
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => RegisterUser(profile, null, "fb"),
        //   ),
        // );



        break;
    }
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

  _displayLoginButton() {
    return ElevatedButton(
      child: Text("Login with Facebook"),
      onPressed: () => facebookLogin.isLoggedIn
          .then((isLoggedIn) => isLoggedIn ? _logout() : initiateFacebookLogin()),

    );
  }

  _displayLogoutButton() {
    return ElevatedButton(
      child: Text("Logout"),
      onPressed: () => ElevatedButton(child: Text('log'), onPressed: () {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child:

                      isLoggedIn
                          ? _displayUserData(profileData)
                          // ? _displayLoginButton()
                          :

                      _displayLoginButton(),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('firebase not intialized');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }

                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.firebaseOrange,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
