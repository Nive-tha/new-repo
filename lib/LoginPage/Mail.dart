import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/material/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Facebook.dart';
import 'Google.dart';
import 'Landingpage.dart';
import 'Register.dart';
class Mail extends StatefulWidget {
  @override
  _MailState createState() => _MailState();
}

class _MailState extends State<Mail> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

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
                        key: formKey,
                        child: Column(children: <Widget>[
                          TextFormField(
                              controller: _emailController,
// validator: (value) {
// if (value.isEmpty) {
// return "please enter the username";
// }
// },
                              decoration: InputDecoration(
                                  icon: Icon(Icons.account_circle,
                                      color: Colors.white),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.white))),
                          SizedBox(height: 50),
                          TextFormField(
                              controller: _otpController,
                              obscureText: true,
// validator: (value) {
// // if (value.isEmpty) {
// // return "please enter the password";
// // }
// },
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
                            onPressed: () {
                              _save();
                              Navigator.push(
context,
MaterialPageRoute(
builder: (context) => LandingPage()));
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
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
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ElevatedButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  Facebook()));
                                }, child: Text("Use Another Options")),
                              ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  // child: ElevatedButton(onPressed: (){
                  //                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  //                     Google()));
                  //               }, child: Text("Google")),
                  //             ),
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


