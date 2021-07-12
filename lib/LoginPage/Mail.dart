import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google/LoginPage/reg.dart';
import 'package:google/LoginPage/register1.dart';
import 'package:google/tabspages/homescreen.dart';
import 'package:google/utils/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Forgetpass.dart';
import 'Facebook.dart';
import 'Google.dart';
import 'Landingpage.dart';
import 'package:http/http.dart' as http;

import 'package:google/screens/user_info_screen.dart';

class Mail extends StatefulWidget {
  @override
  _MailState createState() => _MailState();
}

class _MailState extends State<Mail> {
  bool _isSelected = false;
  var mailPic;
  var googlePic;
  var faceBookpic;
  var picStore;
  var mailName;
  var googleName;
  var faceBookName;
  var nameStore;
  var storeEmailUsername;

  var abc;
  late String id;
  String message = '';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _selected = false;
  var users;
  bool _isSigningIn = false;

  bool isLoggedIn = false;
  String saveKeyFacebook = "";
  var profile;
  var detail;
  var details;
  var profileData;
  var facebookLogin = FacebookLogin();
  var storeEmail;
  var mail;
  var googleMail;
  var faceBookMail;
  var mailStore;

  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }

  void initiateFacebookLogin() async {
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

        profile = json.decode(graphResponse.body);
        print(profile.toString());

        onLoginStatusChanged(true, profileData: profile);

        this.detail = profile;

        break;
    }
    var facebookdetails = this.detail['id'];
    print(facebookdetails);

    _apiFace();
  }

  storingProfilePicture() async {
    SharedPreferences storing = await SharedPreferences.getInstance();

    if (this.profileData == null && this.users == null) {
      print(storeEmailUsername);
      print(117);

      mail = storeEmail;
      mailName = storeEmailUsername;
    } else if (this.profileData == null && storeEmailUsername == null) {
      googleMail = this.users.email;
      googleName = this.users.displayName;
    } else if (this.users == null && storeEmailUsername == null) {
      faceBookMail = this.profile['email'];
      faceBookName = this.profileData['name'];
    } else {
      print(119);
    }
    if (googleName == null && faceBookName == null) {
      print(mailPic);
      print(134);

      mailStore = mail;
      nameStore = mailName;
    } else if (googleName == null && mailName == null) {
      // picStore = faceBookpic;
      mailStore = faceBookMail;
      nameStore = faceBookName;
    } else if (storeEmailUsername == null && faceBookName == null) {
      // picStore = googlePic;
      mailStore = googleMail;
      nameStore = googleName;
    } else {
      print(131);
    }

    List<String> stringList = [nameStore, mailStore];

    storing.setStringList('pic', stringList);
  }

  _apiFace() async {
    final String url = "http://2a0cafcf30b5.ngrok.io/exists/facebook";

    final response =
        await http.post(Uri.parse(url), body: {'face_book': this.detail['id']});

    print(response.statusCode);

    var receivedDetails = json.decode(response.body);
    print(receivedDetails);
    var extractedDetail = receivedDetails['status_code'];
    print(extractedDetail);
    var extractedDetail2 =
        receivedDetails['results'][0]['family_id'].toString();
    print(extractedDetail);
    var extractedDetail1 = receivedDetails['results'][0]['id'].toString();
    print(extractedDetail1);
    List<String> stringList = [extractedDetail1, extractedDetail2];

    SharedPreferences prefer = await SharedPreferences.getInstance();
    await prefer.setStringList('idS', stringList);
    print("line no 10");
    print(response.body);
    storingProfilePicture();
    if (response.statusCode == extractedDetail) {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (BuildContext context) => new Reg()));
    } else {
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new Register1(
                    faceBookReceived: this.profileData,
                  )));
    }
  }

  _api1() async {
    final String url = "http://2a0cafcf30b5.ngrok.io/exists/google";
    final response =
        await http.post(Uri.parse(url), body: {'google_id': this.users.uid});

    print(response.statusCode);

    var receivedDetails = json.decode(response.body);
    print(receivedDetails);
    var extractedDetail = receivedDetails['status_code'];
    var extractedDetail2 =
        receivedDetails['results'][0]['family_id'].toString();
    print(extractedDetail2);
    var extractedDetail1 = receivedDetails['results'][0]['id'].toString();
    print(extractedDetail1);
    List<String> stringList = [extractedDetail1, extractedDetail2];

    SharedPreferences prefer = await SharedPreferences.getInstance();
    await prefer.setStringList('idS', stringList);
    print("line no 10");
    print(response.body);
    storingProfilePicture();
    if (response.statusCode == extractedDetail) {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (BuildContext context) => new Reg()));
    } else {
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) =>
                  new Register1(googleReceived: this.users)));
    }
  }

  func(abc) async {
    var text1 = abc;
    print(text1);
    print(226);
    var text2 = _emailController.text;
    List<String> stringList = [text1, text2];

    SharedPreferences prefer = await SharedPreferences.getInstance();
    await prefer.setStringList('a', stringList);
    storeEmailUsername = text1;
    print(storeEmailUsername);
    storeEmail = text2;
    print(storeEmail);
    print(235);
    storingProfilePicture();
  }

  _logout() async {
    await facebookLogin.logOut();
    onLoginStatusChanged(false);
    print("Logged out");
  }

  Future loginUser(String email, String pass) async {
    String url = 'http://2a0cafcf30b5.ngrok.io/user_login';
    final response =
        await http.post(Uri.parse(url), body: {'email': email, 'pass': pass});
    var convertedDatatoJson = jsonDecode(response.body);
    var decode = convertedDatatoJson['User'][0]['id'].toString();
    var decode1 = convertedDatatoJson['User'][0]['family_id'].toString();
    print(decode);
    print(decode1);
    List<String> stringList = [decode, decode1];

    SharedPreferences prefer = await SharedPreferences.getInstance();
    await prefer.setStringList('idS', stringList);
    return convertedDatatoJson;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: height,
        width: width,
        color: Colors.teal[500],
        child: Column(
          children: [
            SizedBox(height: 130),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text(
                "Sign In",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          SizedBox(height: 20),
                          Container(
                            width: 300,
                            height: 50,
                            child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                textCapitalization: TextCapitalization.none,
                                controller: _emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter the username";
                                  }
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.teal[110],
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16.0)),
                                      borderSide: BorderSide(
                                          color: Colors.teal.shade300,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16.0)),
                                      borderSide: BorderSide(
                                          color: Colors.teal.shade300,
                                          width: 1),
                                    ),
                                    prefixIcon: Icon(Icons.account_circle,
                                        color: Colors.white),
                                    labelText: "UserName or Email",
                                    labelStyle:
                                        TextStyle(color: Colors.white))),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 300,
                            height: 50,
                            child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: _otpController,
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter the password";
                                  }
                                },
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.teal[103],
                                    labelText: "Password",
                                    prefixIcon:
                                        Icon(Icons.lock, color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16.0)),
                                      borderSide: BorderSide(
                                          color: Colors.teal.shade300,
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16.0)),
                                      borderSide: BorderSide(
                                          color: Colors.teal.shade300,
                                          width: 1),
                                    ),
                                    labelStyle:
                                        TextStyle(color: Colors.white))),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.white),
                              child: CheckboxListTile(
                                activeColor: Colors.teal[300],
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(
                                  'Remember me',
                                  style: TextStyle(color: Colors.white),
                                ),
                                value: _selected,
                                onChanged: (value) =>
                                    setState(() => _selected = value!),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          FlatButton(
                            onPressed: () async {
                              // if (_formKey.currentState!.validate()) {
                              //   var email = _emailController.text;
                              //   var pass = _otpController.text;
                              //   setState(() {
                              //     message = 'Please Wait...';
                              //   });
                              //   var rsp = await loginUser(email, pass);
                              //   print(rsp);

                              //   abc = rsp['User'][0]['user_name'];

                              //   abc = await func(abc);

                              //   print(abc);
                              //   if (rsp.containsKey('status')) {
                              //     setState(() {
                              //       message = rsp['status_text'];
                              //     });
                              //     if (rsp['status'] == true) {
                              //       Navigator.pushReplacement(
                              //           context,
                              //           new MaterialPageRoute(
                              //               builder: (BuildContext context) =>
                              //                   new Reg()));
                              //     }
                              //   }
                              // }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Reg()));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            minWidth: 300,
                            height: 50,
                            color: Colors.lightBlue.shade900,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new InkWell(
                                  child: new Text(
                                    'Forget Password?',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () => Navigator.pushReplacement(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new ForgetPass())))
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(children: <Widget>[
                            Expanded(
                                child: Container(
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              child: Divider(
                                color: Colors.white,
                              ),
                            )),
                            Text(
                              "OR",
                              style: TextStyle(color: Colors.white),
                            ),
                            Expanded(
                                child: Container(
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              child: Divider(
                                color: Colors.white,
                              ),
                            )),
                          ]),
                          SizedBox(height: 20),
                          FlatButton(
                            onPressed: () async {
                              setState(() {
                                _isSigningIn = true;
                              });
                              await Authentication.initializeFirebase(
                                  context: context);
                              User? user =
                                  await Authentication.signInWithGoogle(
                                      context: context);
                              this.users = user;
                              print(this.users.uid);

                              print(user!.uid);

                              setState(() {
                                _isSigningIn = false;
                              });
                              _api1();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              width: 270,
                              child: Row(
                                children: [
                                  Image.asset('assets/google.jpeg',
                                      height: 30, width: 30),
                                  Text(
                                    '   Continue with Google',
                                    style: TextStyle(
                                        color: Colors.lightBlue.shade900),
                                  ),
                                ],
                              ),
                            ),
                            height: 50,
                            color: Colors.white,
                          ),
                          SizedBox(height: 20),
                          FlatButton(
                            onPressed: () async {
                              facebookLogin.isLoggedIn.then((isLoggedIn) =>
                                  isLoggedIn
                                      ? _logout()
                                      : initiateFacebookLogin());
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              width: 270,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/facebook.jpeg',
                                    height: 30,
                                    width: 30,
                                  ),
                                  Text(
                                    '   Continue with Facebook',
                                    style: TextStyle(
                                        color: Colors.lightBlue.shade900),
                                  ),
                                ],
                              ),
                            ),
                            height: 50,
                            color: Colors.white,
                          ),
                          SizedBox(height: 20),
                          FlatButton(
                            onPressed: () {
                              var empty1 = "";
                              Navigator.pushReplacement(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new Register1(empty: empty1)));
                            },
                            child: Text(
                              "Don't Have an account? Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ])),
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
