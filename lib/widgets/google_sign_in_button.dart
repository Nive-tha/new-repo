// //  import 'package:firebase_auth/firebase_auth.dart';
// //  import 'package:flutter/material.dart';
// //  import 'package:google/screens/user_info_screen.dart';
// //  import 'package:google/utils/authentication.dart';
// //  import 'package:google/widgets/resgister_new.dart';
// //  import './register.dart';
// //  class GoogleSignInButton extends StatefulWidget {
// //   @override
// //   _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
// //  }
// //
// //  class _GoogleSignInButtonState extends State<GoogleSignInButton> {
// //   bool _isSigningIn = false;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 16.0),
// //       child: _isSigningIn
// //           ? CircularProgressIndicator(
// //               valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
// //             )
// //           : OutlinedButton(
// //               style: ButtonStyle(
// //                 backgroundColor: MaterialStateProperty.all(Colors.white),
// //                 shape: MaterialStateProperty.all(
// //                   RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(40),
// //                   ),
// //                 ),
// //               ),
// //               onPressed: () async {
// //                 setState(() {
// //                   _isSigningIn = true;
// //                 });
// //                 var user =
// //                     await Authentication.signInWithGoogle(context: context);
// //
// //                 setState(() {
// //                   _isSigningIn = false;
// //                 });
// //                 //
// //                 if (user != null) {
// //                   Navigator.of(context).push(
// //                     MaterialPageRoute(
// //                       builder: (context) => RegisterUser( null, user, "gmail"),
// //                     ),
// //                   );
// //                 }
// //               },
// //               child: Padding(
// //                 padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
// //                 child: Row(
// //                   mainAxisSize: MainAxisSize.min,
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: <Widget>[
// //                     Image(
// //                       image: AssetImage("assets/google_logo.png"),
// //                       height: 35.0,
// //                     ),
// //                     Padding(
// //                       padding: const EdgeInsets.only(left: 10),
// //                       child: Text(
// //                         'Sign in with Google',
// //                         style: TextStyle(
// //                           fontSize: 20,
// //                           color: Colors.black54,
// //                           fontWeight: FontWeight.w600,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //     );
// //   }
// // }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google/LoginPage/Landingpage.dart';
// import 'package:google/LoginPage/Register.dart';
//
// import 'package:google/screens/user_info_screen.dart';
// import 'package:google/utils/authentication.dart';
// import 'package:google/screens/user_info_screen.dart';
// import 'package:google/utils/authentication.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class GoogleSignInButton extends StatefulWidget {
//   @override
//   _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
// }
//
// class _GoogleSignInButtonState extends State<GoogleSignInButton> {
//   var users ;
//    // String saveKeyGoogle = "";
//   bool _isSigningIn = false;
//
//   _api() async {
//     // print("Hello");
//     // print(users.uid);
//     // print(this.users.uid);
//     // print(users!.uid);
//     // print(this.users!.uid);
//     // print("Hello");
//     final String url ="http://3406e34d4654.ngrok.io/exists/google";
//     final response = await http.post(Uri.parse(url), body: {
//       'google_id': this.users.uid
//     });
//     print(response.statusCode);
//     print(response.body);
//     if(response.statusCode==200){
//       Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
//     }
//     else{
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>Register(googleReceived: this.users)));
//   }}
//   // Future<bool> _storeGoogleId() async
//   // {
//   // //   SharedPreferences save = await SharedPreferences.getInstance();
//   //   save.clear();
//   //   print("welcome");
//   //   print(users!.uid);
//   //
//   //   return save.setString(saveKeyGoogle, users!.uid);
//   //
//   // }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: _isSigningIn
//           ? CircularProgressIndicator(
//         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//       )
//           : OutlinedButton(
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(Colors.white),
//           shape: MaterialStateProperty.all(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(40),
//             ),
//           ),
//         ),
//         onPressed: () async {
//           setState(() {
//             _isSigningIn = true;
//           });
//
//           User? user =
//           await Authentication.signInWithGoogle(context: context);
//           this.users=user;
//           print(this.users.uid);
//           // print(this.users!.uid);
//           // print(users['uid']);
//
//           // print(user);
//           print(user!.uid);
//
//
//           setState(() {
//             _isSigningIn = false;
//           });
//           _api();
//
//           // _storeGoogleId();
//           // var rsp=_api();
//     // if (rsp.containsKey('status')) {
//     //   if (rsp['status'] == true) {
//     //
//     //     Navigator.push(
//     //         context,
//     //         MaterialPageRoute(
//     //             builder: (context) => LandingPage()));
//     //   }
//     // }
//
//           // _storeGoogleId();
//
//           // if (user != null) {
//           //   print("Line no 127");
//           //      Navigator.of(context).pushReplacement(
//           //     MaterialPageRoute(
//           //       builder: (context) => UserInfoScreen(
//           //         user: user,
//           //       ),
//           //     ),
//           //   );
//           // }
//         },
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Image(
//                 image: AssetImage("assets/google_logo.png"),
//                 height: 35.0,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: Text(
//                   'Sign in with Google',
//
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }