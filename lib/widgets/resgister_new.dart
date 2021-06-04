// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class RegisterUser extends StatefulWidget {
//   final profile;
//   final user;
//   final String socialType;
//
//   RegisterUser(this.profile, this.user, this.socialType);
//
//   @override
//   _RegisterUserState createState() => _RegisterUserState();
// }
//
// class _RegisterUserState extends State<RegisterUser> {
//
//   @override
//   Widget build(BuildContext context) {
//     final User _user = widget.user;
//     return Column(
//       children: <Widget>[
//         widget.socialType == "fb"
//             ? Column(
//                 children: <Widget>[
//                   Container(
//                     child: Text(widget.profile["first_name"]),
//                   ),
//                   Container(
//                     child: Text(widget.profile["picture"]['data']['url']),
//                   ),
//                   Container(
//                     child: Text(widget.profile["name"]),
//                   ),
//                 ],
//               )
//             : Column(
//                 children: <Widget>[
//                   Container(
//                     child: Text( _user.displayName!),
//                   ),
//                   Container(
//                     child: Text( _user.email!),
//                   ),
//                   Container(
//                     child: Text( _user.photoURL!),
//                   ),
//                 ],
//               )
//       ],
//     );
//   }
// }
