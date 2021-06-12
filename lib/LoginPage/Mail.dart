import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/material/colors.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google/LoginPage/reg.dart';
import 'package:google/LoginPage/register1.dart';
import 'package:google/tabspages/homescreen.dart';
// import 'package:google/LoginPage/register1.dart';
import 'package:google/utils/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Forgetpass.dart';
import 'Facebook.dart';
import 'Google.dart';
import 'Landingpage.dart';
import 'package:http/http.dart' as http;
// import 'Register.dart';
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
  var mailId;
  var googleId;
  var facebookId;
  var mailStore;

  var abc;
  late String id;
  String message = '';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  var users;
  // String saveKeyGoogle = "";
  bool _isSigningIn = false;

  bool isLoggedIn = false;
  String saveKeyFacebook = "";
  var profile;
  var detail;
  var details;
  var profileData;
  var facebookLogin = FacebookLogin();
  var storeEmail;

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

        profile = json.decode(graphResponse.body);
        print(profile.toString());

        onLoginStatusChanged(true, profileData: profile);
        // sr
        //
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => RegisterUser(profile, null, "fb"),
        //   ),
        // );
        this.detail = profile;
        //  this.details= profileData;
        // print(profileData);
        // print( "line no :66" + this.detail );
        // print( "line no :67" + this.details );.
        break;
    }
    var facebookdetails = this.detail['id'];
    print(facebookdetails);

    // var facebookdetail = this.details['name'];
    // print(facebookdetail);
    // print(profile);
    // print(profileData);

    // _storeFacebookId();
    // storingProfilePicture();
    // Navigator.pushReplacement(context, new MaterialPageRoute(
    //     builder: (BuildContext context) => new Register1(faceBookReceived: this.profileData,)));
    _apiFace();
  }

  storingProfilePicture() async {
    SharedPreferences storing = await SharedPreferences.getInstance();

    if (this.profileData == null && this.users == null) {
      print(storeEmailUsername);
      print(117);
      // mailPic = abc;
      mailName = storeEmailUsername;
      mailId = storeEmail;
    } else if (this.profileData == null && storeEmailUsername == null) {
      // googlePic = this.users.photoURL!;
      googleName = this.users.displayName;
      googleId = this.users.email;
    } else if (this.users == null && storeEmailUsername == null) {
      // faceBookpic = this.profileData['picture']['data']['url'];
      faceBookName = this.profileData['name'];
      facebookId=this.profileData['email'];
    } else {
      print(119);
    }
    if (googleName == null && faceBookName == null) {
      print(mailPic);
      print(134);
      // picStore = mailPic;
      nameStore = mailName;
      mailStore = mailId;
    } else if (googleName == null && mailName == null) {
      // picStore = faceBookpic;
      nameStore = faceBookName;
      mailStore = facebookId;
    } else if (storeEmailUsername == null && faceBookName == null) {
      // picStore = googlePic;
      nameStore = googleName;
      mailStore = googleId;
    } else {
      print(131);
    }
    List<String> stringList = [nameStore, mailStore];
    storing.setStringList('pic',stringList );
  }

  _apiFace() async {
    final String url = "http://c21e38e4cf26.ngrok.io/exists/facebook";

    final response =
        await http.post(Uri.parse(url), body: {'face_book': this.detail['id']});

    print(response.statusCode);

    var receivedDetails = json.decode(response.body);
    print(receivedDetails);
    var extractedDetail = receivedDetails['status_code'];
    print(extractedDetail);
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

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) =>
    //             MyHomePage(faceBookLanding: this.profileData)));
  }

  _api1() async {
    final String url = "http://c21e38e4cf26.ngrok.io/exists/google";
    final response =
        await http.post(Uri.parse(url), body: {'google_id': this.users.uid});

    print(response.statusCode);

    var receivedDetails = json.decode(response.body);
    print(receivedDetails);
    var extractedDetail = receivedDetails['status_code'];
    print(extractedDetail);
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

    //
  }

  func(abc) async {
    var text1 = abc;
    print(text1);
    print(226);
    var text2 = _emailController.text;
    // var text3 = id;
    List<String> stringList = [text1, text2];

    SharedPreferences prefer = await SharedPreferences.getInstance();
    await prefer.setStringList('a', stringList);
    storeEmailUsername = text1;
    storeEmail = text2;
    print(storeEmailUsername);
    print(235);
    storingProfilePicture();
  }

  // fun(id) async {
  //   var mapid = id;
  //   print(mapid);
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   await pref.setString('map_id', mapid);
  // }
  // sendingSharedPreference() async{
  //   var facebooksave = this.profileData['name'];
  //   var googleSave = this.users.displayName;
  //   print(googleSave);
  //   print(facebooksave);
  //   print(173);
  //   SharedPreferences get = await SharedPreferences.getInstance();
  //   List <String> stringListForFaceAndGoogle = [facebooksave,googleSave];
  //   await get.setStringList('b', stringListForFaceAndGoogle);
  //
  // }

  _logout() async {
    await facebookLogin.logOut();
    onLoginStatusChanged(false);
    print("Logged out");
  }

  Future loginUser(String email, String pass) async {
    String url = 'http://c21e38e4cf26.ngrok.io/user_login';
    final response =
        await http.post(Uri.parse(url), body: {'email': email, 'pass': pass});
    var convertedDatatoJson = jsonDecode(response.body);
    return convertedDatatoJson;
  }

  @override
  Widget build(BuildContext context) {
// var elevatedButton =
// ElevatedButton(onPressed: verifyOTP, child: Text('verifyOTP'));
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Login Screen"),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: 50),
                    Text("Welcome!",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Color(0xFF00695C),
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat-ExtraBold")),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: 10),
              Text(
                "Sign in with your family",
                style: TextStyle(
                    color: Color(0xFF00695C),
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              Image.asset('assets/Login.png'),
              SizedBox(height: 30),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Color(0xFF00897B),
                elevation: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Form(
                                    key: _formKey,
                                    child: Column(children: <Widget>[
                                      SizedBox(height: 20),
                                      TextFormField(
                                          controller: _emailController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "please enter the username";
                                            }
                                          },
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              prefixIcon: Icon(
                                                  Icons.account_circle,
                                                  color: Colors.white),
                                              hintText:
                                                  "Email or Mobile number",
                                              hintStyle: TextStyle(
                                                  color: Colors.white))),
                                      SizedBox(height: 20),
                                      TextFormField(
                                          controller: _otpController,
                                          obscureText: true,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "please enter the password";
                                            }
                                          },
                                          decoration: InputDecoration(
                                              hintText: "Password",
                                              prefixIcon: Icon(Icons.lock,
                                                  color: Colors.white),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              hintStyle: TextStyle(
                                                  color: Colors.white))),
                                    ])),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // GestureDetector(
                                    //   onTap: _radio,
                                    //   child: radioButton(_isSelected),
                                    // ),

                                    // Text('Remember me',
                                    //     style: TextStyle(color: Colors.white)),
                                    new InkWell(
                                        child: new Text('Forget Password'),
                                        onTap: () => Navigator.pushReplacement(
                                            context,
                                            new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new ForgetPass())))
                                  ],
                                ),
                                SizedBox(height: 20),
                                FlatButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      var email = _emailController.text;
                                      var pass = _otpController.text;
                                      setState(() {
                                        message = 'Please Wait...';
                                      });
                                      var rsp = await loginUser(email, pass);
                                      print(rsp);

                                      abc = rsp['User'][0]['user_name'];
                                      // id = rsp['User'][0]['id'];
                                      // id = await fun(id);
                                      abc = await func(abc);

                                      print(abc);
                                      if (rsp.containsKey('status')) {
                                        setState(() {
                                          message = rsp['status_text'];
                                        });
                                        if (rsp['status'] == true) {
                                          // lorsp['User'][0]['user_na'] //praveen111
                                          Navigator.pushReplacement(
                                              context,
                                              new MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          new Reg()));
                                        }
                                      }
                                    }
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => LandingPage()));
                                    // _save();
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  minWidth: 500,
                                  color: Colors.white,
                                ),
                              ],
                            )))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Login Instantly",
                style: TextStyle(
                    color: Color(0xFF00695C),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins-Medium"),
              ),
              SizedBox(height: 10),
              Container(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.all(1.0),
                          //   child: ElevatedButton(onPressed: (){
                          //     Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          //     Facebook()));
                          //   }, child: Text("Use Another Options")),
                          // ),
                          //             Padding(
                          //               padding: const EdgeInsets.all(8.0),
                          // child: ElevatedButton(onPressed: (){
                          //                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          //                     Google()));
                          //               }, child: Text("Google")),
                          //             ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: FlatButton(
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
                                  // print(this.users!.uid);
                                  // print(users['uid']);

                                  // print(user);
                                  print(user!.uid);

                                  setState(() {
                                    _isSigningIn = false;
                                  });
                                  // storingProfilePicture();

                                  _api1();

                                  //

                                  // _storeGoogleId();
                                  // var rsp=_api();
                                  // if (rsp.containsKey('status')) {
                                  //   if (rsp['status'] == true) {
                                  //
                                  //     Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //             builder: (context) => LandingPage()));
                                  //   }
                                  // }

                                  // _storeGoogleId();

                                  // if (user != null) {
                                  //   print("Line no 127");
                                  //      Navigator.of(context).pushReplacement(
                                  //     MaterialPageRoute(
                                  //       builder: (context) => UserInfoScreen(
                                  //         user: user,
                                  //       ),
                                  //     ),
                                  //   );
                                  // }
                                },
                                child: Image.asset('assets/google.jpeg')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: FlatButton(
                                onPressed: () {
                                  facebookLogin.isLoggedIn.then((isLoggedIn) =>
                                      isLoggedIn
                                          ? _logout()
                                          : initiateFacebookLogin());

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Register()));
                                },
                                child: Image.asset('assets/facebook.jpeg')),
                          ),
                        ]),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Do you have an account?",
                      style: TextStyle(
                          color: Color(0xFF00695C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat-ExtraBold")),
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
                      "Register here",
                      style: TextStyle(color: Color(0xFF0D47A1)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }

// child: ElevatedButton(
//     onPressed: () {
//       var empty1 = "";
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   Register(empty: empty1)));
//     },
//     child: Text('Register')),
}
