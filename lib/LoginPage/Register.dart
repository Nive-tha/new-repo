// // import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:google/LoginPage/Landingpage.dart';
// import 'package:google/screens/sign_in_screen.dart';
// import 'package:google/utils/authentication.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:google/LoginPage/Profile.dart';
// import 'package:google/main.dart';
//
// import 'Mail.dart';
//
// class Register extends StatefulWidget {
//   Register({this.faceBookReceived, this.googleReceived, this.empty});
//   var faceBookReceived;
//   var googleReceived;
//   var empty;
//   @override
//   _RegisterState createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   var profileData;
//   var facebookLogin = FacebookLogin();
//   bool isLoggedIn = false;
//
//   void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
//     setState(() {
//       this.isLoggedIn = isLoggedIn;
//       this.profileData = profileData;
//     });
//   }
//
//   bool _isSigningOut = false;
//   @override
//   // void initState(){
//   //   // _get();
//   //   // getT ();
//   //   super.initState();
//   // }
//   var saveKeyGoogle = "";
//   var saveKeyFacebook = "";
//
//   // _get () async {
//   //   SharedPreferences save1 = await SharedPreferences.getInstance();
//   //   fa.text=save1.getString(saveKeyFacebook)!;
//   //   print(fa.text);
//   // }
//   // getT () async {
//   //   SharedPreferences save = await SharedPreferences.getInstance();
//   //   g.text=save.getString(saveKeyGoogle)!;
//   //   print(g.text);
//   // }
//
//   final prefs = SharedPreferences.getInstance();
//   var u = TextEditingController();
//   var e = TextEditingController();
//   var p = TextEditingController();
//   var pa = TextEditingController();
//   var f = TextEditingController();
//   var g = TextEditingController();
//   var fa = TextEditingController();
//   var fam = TextEditingController();
//
//   String a = "";
//   func() {
//     var abc = prefs;
//     print(abc);
//   }
//
//   Future _save(a) async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'my_int_key';
//     String userName = a;
//     // print(user_name);
//     final v = prefs.setString(key, '$userName');
//     print(v);
//     final String url = "http://8b8b2bbe168b.ngrok.io/user";
//     final response = await http.post(Uri.parse(url), body: {
//       'user_name': a,
//       // 'email': b,
//       // 'phone': c,
//       // 'pass': d,
//       // 'fcm_token': ef,
//       // 'google_id': gh,
//       // 'face_book': i,
//       // 'family_id': j
//     });
//     if (response.statusCode == 200) {
//       final String responseString = response.body;
//       // final String name = responstring[]
//       print(responseString);
//       print(response);
//       print(response.body);
//       print(response.statusCode);
//     }
//   }
//
//   Future _read(a, b, c, d, ef, gh, i, j) async {
//     final String url = "http://8b8b2bbe168b.ngrok.io/register";
//
//     final response = await http.post(Uri.parse(url), body: {
//       'user_name': a,
//       'email': b,
//       'phone': c,
//       'pass': d,
//       'fcm_token': ef,
//       'google_id': gh,
//       'face_book': i,
//       'family_id': j
//     });
//
//     print(response);
//     // final String bUrl = "http://192.168.1.23:3300/register/family";
//     // final bull = await http
//     //     .post(Uri.parse(bUrl), body: {'family_id': j, 'family_name': b});
//
//     // print(bull);
//     // if (bull.statusCode == 200) {
//     //   final String name = bull.body;
//     //   print(name);
//     // }
//     // print(u.text);
//     // print(response);
//
//     if (response.statusCode == 200) {
//       final String responseString = response.body;
//       // final String name = responstring[]
//       print(responseString);
//       print(response);
//       print(response.body);
//       print(response.statusCode);
//     }
//     // _onCustomAnimationAlertPressed(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (widget.faceBookReceived == null && widget.googleReceived == null) {
//       print("hello empty");
//       print(widget.faceBookReceived);
//       g.text = widget.empty;
//       u.text = widget.empty;
//       e.text = widget.empty;
//     } else if (widget.faceBookReceived == null && widget.empty == null) {
//       print("hello google");
//
//       u.text = widget.googleReceived.displayName;
//       e.text = widget.googleReceived.email;
//     } else if (widget.empty == null && widget.googleReceived == null) {
//       print("hello facebook");
//       print(widget.faceBookReceived);
//
//       u.text = widget.faceBookReceived['name'];
//       e.text = widget.faceBookReceived['email'];
//     } else {
//       print("nothing worked");
//     }
//     //
//     //
//     print(widget.googleReceived);
//     print(widget.faceBookReceived);
//
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Register"),
//         ),
//         body: ListView(children: [
//           Container(
//             // height: double.infinity,
//             //   width:double.infinity,
//             height: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                   Colors.cyan,
//                   Colors.cyan,
//                   Colors.cyan,
//                   Colors.cyan,
//                 ])),
//             child: Center(
//               child: new Column(
//                 children: <Widget>[
//                   SizedBox(height: 10),
//                   TextFormField(
//                       controller: u,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "please enter the username";
//                         }
//                       },
//                       decoration: InputDecoration(
//                           icon: Icon(Icons.person, color: Colors.white),
//                           hintText: "UserName",
//                           hintStyle: TextStyle(color: Colors.white))),
//                   SizedBox(height: 10),
//                   TextFormField(
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "please enter the mail id";
//                         }
//                       },
//                       controller: e,
//                       decoration: InputDecoration(
//                           icon: Icon(Icons.person, color: Colors.white),
//                           hintText: "Email",
//                           hintStyle: TextStyle(color: Colors.white))),
//                   SizedBox(height: 10),
//                   TextFormField(
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "please enter the Phone no";
//                         }
//                       },
//                       controller: p,
//                       decoration: InputDecoration(
//                           icon: Icon(Icons.mail, color: Colors.white),
//                           hintText: "Phone",
//                           hintStyle: TextStyle(color: Colors.white))),
//                   SizedBox(height: 10),
//                   TextFormField(
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "please enter valid password";
//                         }
//                       },
//                       controller: pa,
//                       decoration: InputDecoration(
//                           icon: Icon(Icons.mail, color: Colors.white),
//                           hintText: "Password",
//                           hintStyle: TextStyle(color: Colors.white))),
//                   SizedBox(height: 10),
//                   TextFormField(
//                       controller: f,
//                       decoration: InputDecoration(
//                           icon: Icon(Icons.lock, color: Colors.white),
//                           hintText: "FCM_TOKEN",
//                           hintStyle: TextStyle(color: Colors.white))),
//                   SizedBox(height: 10),
//                   TextFormField(
//                       enabled: false,
//                       controller: g,
//                       decoration: InputDecoration(
//                           icon: Icon(Icons.mail, color: Colors.white),
//                           hintText: "GoogleID",
//                           hintStyle: TextStyle(color: Colors.white))),
//                   SizedBox(height: 10),
//                   TextFormField(
//                       enabled: false,
//                       controller: fa,
//                       decoration: InputDecoration(
//                           icon: Icon(Icons.mail, color: Colors.white),
//                           hintText: "FACEBOOK",
//                           hintStyle: TextStyle(color: Colors.white))),
//                   SizedBox(height: 10),
//                   TextFormField(
//                       controller: fam,
//                       decoration: InputDecoration(
//                           icon: Icon(Icons.mail, color: Colors.white),
//                           hintText: "FamilyID",
//                           hintStyle: TextStyle(color: Colors.white))),
//                   SizedBox(height: 10),
//                   Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           Colors.cyan,
//                           Colors.cyan,
//                           Colors.cyan,
//                           Colors.cyan,
//                         ],
//                       ),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ElevatedButton(
//                             autofocus: true,
//                             child: Text('Register'),
//                             onPressed: () {
//                               final String a = u.text;
//                               final String b = e.text;
//                               final String c = p.text.toString();
//                               final String d = pa.text;
//                               final String ef = f.text;
//                               final String gh = g.text;
//                               final String i = fa.text;
//                               final String j = fam.text.toString();
//                               // print(a);
//                               // _func(a);
//
//                               _read(a, b, c, d, ef, gh, i, j);
//
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => Mail()));
//                             },
//
//                             // print(user);
//                           ),
//                         ),
//                         // ElevatedButton(
//                         //     onPressed: () async {
//                         //       // final String url =
//                         //       //     "http://192.168.1.23:3300/register";
//                         //       // final res = await http.get(Uri.parse(url));
//                         //       // var people = json.decode(res.body);
//                         //       // // print(people);
//                         //       // // print(people['result']['user_name']);
//                         //       // print(people['result'][0]['user_name']);
//                         //     },
//                         //     child: Text('read')),
//                         SizedBox(height: 30),
//                       ],
//                     ),
//                   ),
//                   // ElevatedButton(
//                   //     onPressed: () async {
//                   //
//                   //         setState(() {
//                   //           _isSigningOut = true;
//                   //         });
//                   //         await Authentication.signOut(context: context);
//                   //         setState(() {
//                   //           _isSigningOut = false;
//                   //         });
//                   //         // SharedPreferences reset = await SharedPreferences.getInstance();
//                   //         //
//                   //         // reset.remove(saveKeyGoogle);
//                   //         // // reset.clear();
//                   //         // reset.remove(saveKeyFacebook);
//                   //         // reset.clear();
//                   //
//                   //
//                   //
//                   //         Navigator.of(context)
//                   //             .push(MaterialPageRoute(builder: (context)=>Mail()));
//                   //       },
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => Profile()));
//
//                   // child: Text('Signout'))
//                 ],
//               ),
//             ),
//           ),
//           //   ElevatedButton(
//           //     onPressed: () {
//           //       final String a = u.text;
//           //       _save(a);
//           //     },
//           //     child: Text('save'),
//           //   ),
//           //   SizedBox(height: 30),
//           //   ElevatedButton(onPressed: _logout, child: Text('Logout'),),
//           // ],
//         ]));
//   }
//   // _onCustomAnimationAlertPressed(context) {
//   //   Alert(
//   //     context: context,
//   //     title: "Registration",
//   //     desc: "Successfully",
//   //     alertAnimation: fadeAlertAnimation,
//   //   ).show();
//   // }
//   //
//   // Widget fadeAlertAnimation(
//   //     BuildContext context,
//   //     Animation<double> animation,
//   //     Animation<double> secondaryAnimation,
//   //     Widget child,
//   //     ) {
//   //   return Align(
//   //     child: FadeTransition(
//   //       opacity: animation,
//   //       child: child,
//   //     ),
//   //   );
//   // }
//
//   // _logout() async {
//   //   await facebookLogin.logOut();
//   //   onLoginStatusChanged(false);
//   //   print("Logged out");
//   //
//   // }
// }
