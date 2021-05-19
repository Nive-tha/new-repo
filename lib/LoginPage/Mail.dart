import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/material/colors.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google/utils/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Facebook.dart';
import 'Google.dart';
import 'Landingpage.dart';
import 'package:http/http.dart' as http;
import 'Register.dart';
import 'package:google/screens/user_info_screen.dart';
class Mail extends StatefulWidget {
  @override
  _MailState createState() => _MailState();
}

class _MailState extends State<Mail> {

  var abc;
  String message = '';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  var users ;
  // String saveKeyGoogle = "";
  bool _isSigningIn = false;

  bool isLoggedIn = false;
  String saveKeyFacebook = "";
  var profile;
  var detail;
  var details;
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
            'https://graph.facebook.com/v2.12/me?fields=name,id,first_name,last_name,email,picture.height(200)&access_token=${facebookLoginResult
                .accessToken.token}'));

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
        // print( "line no :67" + this.details );
        break;
    }
    var facebookdetails = this.detail['id'];
    print(facebookdetails);

    // var facebookdetail = this.details['name'];
    // print(facebookdetail);
    // print(profile);
    // print(profileData);

    // _storeFacebookId();
    _apiFace();


        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Register(faceBookReceived: this.profileData)));



  }

  _apiFace() async {
    final String url = "http://3406e34d4654.ngrok.io/exists/facebook";

    final response = await http.post(Uri.parse(url), body: {
      'face_book': this.detail['id']
    });

    print(response.statusCode);

    var receivedDetails = json.decode(response.body);
    print(receivedDetails);
    var extractedDetail = receivedDetails['results'][0]['user_name'];
    print(extractedDetail);
    print("line no 10");
    print(response.body);
    if(response.statusCode==200){
      Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
    }

      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(faceBookLanding: this.profileData)));

  }



  _api1() async {
    // print("Hello");
    // print(users.uid);
    // print(this.users.uid);
    // print(users!.uid);
    // print(this.users!.uid);
    // print("Hello");
    final String url ="http://3406e34d4654.ngrok.io/exists/google";
    final response = await http.post(Uri.parse(url), body: {
      'google_id': this.users.uid
    });
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(googleLanding: this.users)));
    }
else {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => Register(googleReceived: this.users)));
    }

  }

  func(abc) async {
    // final pref = await SharedPreferences.getInstance();
    // final key = 'hghg';
    // final v = pref.setString(key, a);
    // print(v);
    var text1 = abc;
    var text2 = _emailController.text;
    List<String> stringList = [text1, text2];

    SharedPreferences prefer = await SharedPreferences.getInstance();
    await prefer.setStringList('a', stringList);
  }
  Future loginUser(String email, String pass) async {
    // final prefs = await SharedPreferences.getInstance();
    // final key = 'my_int_key';
    // final email = emailController.text;
    // final pass = passwordController.text;
    // final v = prefs.setString(key, 'email:$email');
    // print(v);
    // print('saved $email,$pass');
    String url = 'http://3406e34d4654.ngrok.io/user_login';
    final response =
    await http.post(Uri.parse(url), body: {'email': email, 'pass': pass});
    var convertedDatatoJson = jsonDecode(response.body);
    return convertedDatatoJson;
  }
// void sendOTP() async {
// EmailAuth.sessionName = "Test Session";
// var res = await EmailAuth.sendOtp(receiverMail: _emailController.text);
// if (res) {
// print("OTP Sent");
// } else {
// print("We could not sent the Otp");
// }
// }

// void verifyOTP() {
// var alert = "wrong message";
// var res = EmailAuth.validate(
// receiverMail: emailController.text, userOTP: otpController.text);
// if (res) {
// print("OTP Verified");
// Navigator.push(
// context, MaterialPageRoute(builder: (context) => Register()));
// showDialog(
// context: context,
// builder: (context) {
// return AlertDialog(
// title: Text('hello'),
// content: Text("Correct Otp"),
// actions: <Widget>[
// ElevatedButton(
// child: Text('Yes'),
// onPressed: () {},
// ),
// ElevatedButton(
// child: Text('No'),
// onPressed: () {},
// ),
// ],
// );
// });
// } else {
// print("Invalid OTP");
// showDialog(
// context: context,
// builder: (context) {
// return AlertDialog(
// title: Text('hello'),
// content: Text("where are you"),
// actions: <Widget>[
// ElevatedButton(
// child: Text('Yes'),
// onPressed: () {},
// ),
// ElevatedButton(
// child: Text('No'),
// onPressed: () {},
// ),
// ],
// );
// });
// }
// }

  @override
  Widget build(BuildContext context) {
// var elevatedButton =
// ElevatedButton(onPressed: verifyOTP, child: Text('verifyOTP'));
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: new Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.cyan,
                        Colors.cyan,
                        Colors.cyan,
                        Colors.cyan,
                      ])),
              child: Center(
                  child: new Column(children: <Widget>[
                    SizedBox(height: 70),
                    Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          TextFormField(
                              controller: _emailController,
validator: (value) {
if (value!.isEmpty) {
return "please enter the username";
}
},
                              decoration: InputDecoration(
                                  icon: Icon(Icons.account_circle,
                                      color: Colors.white),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.white))),
                          SizedBox(height: 50),
                          TextFormField(
                              controller: _otpController,
                              obscureText: true,
validator: (value) {
if (value!.isEmpty) {
return "please enter the password";
}
},
                              decoration: InputDecoration(
                                  icon: Icon(Icons.lock, color: Colors.white),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.white))),
                        ])),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.cyan,
                            Colors.cyan,
                            Colors.cyan,
                            Colors.cyan,
                          ],
                        ),
                      ),
// child: ButtonTheme(
// buttonColor: Colors.white10,
// // height: 50.0,
// minWidth: double.infinity,
// child: elevatedButton,
// ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.cyan,
                            Colors.cyan,
                            Colors.cyan,
                            Colors.cyan,
                          ],
                        ),
                      ),

                      child: ButtonTheme(
                        buttonColor: Colors.white10,
// height: 50.0,
                        minWidth: double.infinity,
                        child: ElevatedButton(
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
                    abc = await func(abc);
                    print(abc);
                    if (rsp.containsKey('status')) {
                    setState(() {
                    message = rsp['status_text'];
                    });
                    if (rsp['status'] == true) {
                    // lorsp['User'][0]['user_na'] //praveen111
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => LandingPage()));
                    }
                    }
                    }
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => LandingPage()));
                    // _save();
                    },
                        child: Text('Login')),
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.cyan,
                            Colors.cyan,
                            Colors.cyan,
                            Colors.cyan,
                          ],
                        ),
                      ),

                      child: ButtonTheme(
                        buttonColor: Colors.white10,
// height: 50.0,
                        minWidth: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              var empty1= "";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register(empty:empty1)));
                            },
                            child: Text('Register')),
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                padding: const EdgeInsets.all(1.0),
                                child: ElevatedButton(onPressed:() async{

    setState(() {
    _isSigningIn = true;
       });
   await Authentication.initializeFirebase(context: context);
    User? user =
    await Authentication.signInWithGoogle(context: context);
    this.users=user;
    print(this.users.uid);
    // print(this.users!.uid);
    // print(users['uid']);

    // print(user);
    print(user!.uid);


    setState(() {
    _isSigningIn = false;
    });
    _api1();

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
                                 child: Text("Google")),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ElevatedButton(onPressed:(){
                                  facebookLogin.isLoggedIn
                                      .then((isLoggedIn) =>
                                  isLoggedIn
                                      ? _logout()
                                      : initiateFacebookLogin());

                                  Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => Register()));

                                }, child: Text("Facebook")),
                              ),
                            ]

                          ),
                        )
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.cyan,
                            Colors.cyan,
                            Colors.cyan,
                            Colors.cyan,
                          ],
                        ),
                      ),
// child: ButtonTheme(
// buttonColor: Colors.white10,
// // height: 50.0,
// minWidth: double.infinity,
// child: ElevatedButton(
// onPressed: () => sendOTP(), child: Text('send OTP')),
// ),
                    ),
// SizedBox(height: 50),
// Container(
// child: ElevatedButton(
// child: Text('Read'),
// onPressed: _read,
// ),
// ),
                    SizedBox(height: 50),
// Container(
// child: ElevatedButton(
// child: Text('Save'),
// onPressed: _save,
// ),
// )
                  ]))),
        ));
  }

// _read() async {
// final prefs = await SharedPreferences.getInstance();
// final key = 'my_int_key';
// final String email = _emailController.text;
// final String password = _otpController.text;
// final value = prefs.getString(key);
// print(value);
// // print(key);
// // print(prefs);
// print('read: $email,$password');
// }
  _logout() async {
    await facebookLogin.logOut();
    onLoginStatusChanged(false);
    print("Logged out");
  }
  _save() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    final String email = _emailController.text;
    final String password = _otpController.text;
    final v = prefs.setString(key, '$email,$password');
    print('saved $email,$password');
    print(v);
  }
}


