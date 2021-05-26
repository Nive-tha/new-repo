// import 'package:flutter/material.dart';
// import 'dart:convert';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:google/LoginPage/Google.dart';
// import 'package:google/LoginPage/Landingpage.dart';
// import 'package:google/LoginPage/Register.dart';
// import 'package:google/new.dart';
// import 'package:google/res/custom_colors.dart';
// import 'package:google/utils/authentication.dart';
// // ignore: unused_import
// import 'package:google/widgets/fb_sign_in_button.dart';
// import 'package:google/widgets/google_sign_in_button.dart';
// import 'package:google/widgets/register.dart';
// import 'package:google/widgets/resgister_new.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SignInScreen extends StatefulWidget {
//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen> {
//   bool isLoggedIn = false;
//   String saveKeyFacebook = "";
//   var profile;
//   var detail;
//   var details;
//   var profileData;
//   var facebookLogin = FacebookLogin();
//
//   void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
//     setState(() {
//       this.isLoggedIn = isLoggedIn;
//       this.profileData = profileData;
//     });
//   }
//
//   void initiateFacebookLogin() async {
//     // Navigator.push(
//     //     context, MaterialPageRoute(builder: (context) => SignInScreen()));
//     var facebookLoginResult = await facebookLogin.logIn(['email']);
//     switch (facebookLoginResult.status) {
//       case FacebookLoginStatus.error:
//         onLoginStatusChanged(false);
//         break;
//       case FacebookLoginStatus.cancelledByUser:
//         onLoginStatusChanged(false);
//         break;
//       case FacebookLoginStatus.loggedIn:
//         var graphResponse = await http.get(Uri.parse(
//             'https://graph.facebook.com/v2.12/me?fields=name,id,first_name,last_name,email,picture.height(200)&access_token=${facebookLoginResult
//                 .accessToken.token}'));
//
//         profile = json.decode(graphResponse.body);
//         print(profile.toString());
//
//
//         onLoginStatusChanged(true, profileData: profile);
//         // sr
//         //
//         // Navigator.of(context).push(
//         //   MaterialPageRoute(
//         //     builder: (context) => RegisterUser(profile, null, "fb"),
//         //   ),
//         // );
//         this.detail = profile;
//         //  this.details= profileData;
//         // print(profileData);
//         // print( "line no :66" + this.detail );
//         // print( "line no :67" + this.details );
//         break;
//     }
//     var facebookdetails = this.detail['id'];
//     print(facebookdetails);
//
//     // var facebookdetail = this.details['name'];
//     // print(facebookdetail);
//     // print(profile);
//     // print(profileData);
//
//     // _storeFacebookId();
//     _apiFace();
//     var a = _apiFace();
//     if (a.containsKey('status')) {
//       if (a['status'] == true) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => LandingPage()));
//         // _apiFacegeT();
//       }
//       else {
//         Navigator.push(context, MaterialPageRoute(
//             builder: (context) => Register(faceBookReceived: profileData)));
//       }
//     }
//
//   }
//
//   _apiFace() async {
//     final String url = "http://3406e34d4654.ngrok.io/exists/facebook";
//
//     final response = await http.post(Uri.parse(url), body: {
//       'face_book': this.detail['id']
//     });
//
//     print(response.statusCode);
//
//     var receivedDetails = json.decode(response.body);
//     print(receivedDetails);
//     var extractedDetail = receivedDetails['results'][0]['user_name'];
//     print(extractedDetail);
//     print("line no 10");
//     print(response.body);
//     if(response.statusCode==200){
//       Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
//     }
//   }
//
//   // _apiFacegeT() async {
//   //   final String url ="http://71ccb7ed1db7.ngrok.io/exists/facebook";
//   //
//   //  final response = await http.post(Uri.parse(url));
//   //
//   //   if(response.statusCode==200){
//   //     Navigator.pop(context, MaterialPageRoute(builder: (context)=>LandingPage()));
//   //   }
//   //   else
//   //     {
//   //       print("if else statement");
//   //     }
//   //  print(response);
//   //   print(response.statusCode);
//   //   print("line no 107");
//   //   print(response.body);
//   //
//   //
//   // }
//   // Future<bool> _storeFacebookId() async
//   //  {
//   //    SharedPreferences save1 = await SharedPreferences.getInstance();
//   //    print("finish");
//   //    print(this.detail['id']);
//   //    return save1.setString(saveKeyFacebook, this.detail['id']);
//   //  }
//   _displayUserData(page) {
//     // Navigator.push(
//     //     context,
//     //     MaterialPageRoute(
//     //       builder: (context) => News(),
//     //     ));
//
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Container(
//           height: 200.0,
//           width: 200.0,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               image: NetworkImage(
//                 page['picture']['data']['url'],
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 10.0),
//         Text(
//           "Name: ${page['name']}",
//           style: TextStyle(
//             fontSize: 20.0,
//           ),
//         ),
//         Text(
//
//           "ID: ${page['id']}",
//
//           style: TextStyle(
//             fontSize: 20.0,
//           ),
//         ),
//         ElevatedButton(onPressed: _logout, child: Text('logout'))
//       ],
//     );
//   }
//
//   _logout() async {
//     await facebookLogin.logOut();
//     onLoginStatusChanged(false);
//     print("Logged out");
//   }
//
//   // _displayLoginButton() {
//   //   return SizedBox(
//   //     child: ElevatedButton(
//   //       child: Text("Login with Facebook"),
//   //       onPressed: () => {
//   //           facebookLogin.isLoggedIn
//   //           .then((isLoggedIn) => isLoggedIn ? _logout() : initiateFacebookLogin()),
//   //
//   //         Navigator.push(context, MaterialPageRoute(builder: (context) => Register()))
//   //     }
//   //
//   //     ),
//   //   );
//   // }
//
//   _displayLogoutButton() {
//     return ElevatedButton(
//       child: Text("Logout"),
//       onPressed: () => ElevatedButton(child: Text('log'), onPressed: () {}),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColors.firebaseNavy,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(
//             left: 16.0,
//             right: 16.0,
//             bottom: 20.0,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Row(),
//               Expanded(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                       child:
//
//                       isLoggedIn
//                           ? _displayUserData(profileData)
//                       // ? _displayLoginButton()
//                           :
//
//                       _displayLoginButton(),
//                     ),
//                   ],
//                 ),
//               ),
//               FutureBuilder(
//                 future: Authentication.initializeFirebase(context: context),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return Text('firebase not intialized');
//                   } else if (snapshot.connectionState == ConnectionState.done) {
//                     return Google();
//                   }
//
//                   return CircularProgressIndicator(
//                     valueColor: AlwaysStoppedAnimation<Color>(
//                       CustomColors.firebaseOrange,
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   _displayLoginButton() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//         child: SizedBox(
//         child: ElevatedButton(
//             child: Text("Login with Facebook"),
//             onPressed: () =>
//             {
//               facebookLogin.isLoggedIn
//                   .then((isLoggedIn) =>
//               isLoggedIn
//                   ? _logout()
//                   : initiateFacebookLogin()),
//
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => Register()))
//             }
//
//         ),
//       ),
//     );
//   }
// }