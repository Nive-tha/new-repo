import 'package:flutter/material.dart';
import 'dart:convert';
// import 'package:parampara_login_reg/profile.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile({required this.user});
  final String user;
  @override
  _ScrollState createState() => _ScrollState();
}

class _ScrollState extends State<Profile> {
  var newList;
  String a = "";
  var user = TextEditingController();
  var email = TextEditingController();
  var ph = TextEditingController();
  // var a = TextEditingController();
  // var b = TextEditingController();
  // var c = TextEditingController();
  // var d = TextEditingController();
  // var e = TextEditingController();
  // var f = TextEditingController();
  // var g = TextEditingController();
  // var h = TextEditingController();
  // var a1=TextEditingController();
  // var users = TextEditingController();
  void initState() {
    super.initState();
    dio();
  }

  dio() async {
    SharedPreferences save = await SharedPreferences.getInstance();
    List<String> userDetails = save.getStringList('a')!;
    user.text = userDetails[0];
    // user.text = save.getString('a');

    print(user.text);
    final String url = "http://8b8b2bbe168b.ngrok.io/user";
    final response =
        await http.post(Uri.parse(url), body: {'user_name': '${user.text}'});
    print("hello");
    var list = json.decode(response.body);
    var profile = list['Result'][0];
    // var profileLength = list['Result'][0].length;
    // // List profileNew = profile.map((i) => i.toString()).toList();
    // print(profileLength);
    // for (var i = 0; i <= list['Result'][0].length; i++) {
    //   this.newList = list['Result'][0][i];
    // }
    // var newsList = this.newList;
    // print(newsList);
    print(profile);
    print(profile['user_name']);
    user.text = profile['user_name'];

    email.text = profile['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextFormField(
                controller: user,
                enabled: false,
                decoration: InputDecoration(
                    icon: Icon(Icons.person, color: Colors.white),
                    // hintText: "UserName",
                    hintStyle: TextStyle(color: Colors.white))),
            SizedBox(height: 10),
            TextFormField(
                controller: email,
                enabled: false,
                decoration: InputDecoration(
                    icon: Icon(Icons.person, color: Colors.white),
                    hintText: "email",
                    hintStyle: TextStyle(color: Colors.white))),
            TextFormField(
                controller: ph,
                enabled: false,
                decoration: InputDecoration(
                    icon: Icon(Icons.person, color: Colors.white),
                    hintText: "UserName",
                    hintStyle: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
    // throw UnimplementedError();
  }

//   final List<Map<String, dynamic>> _items = [
//     {
//       'value': 'Male',
//       'label': 'Male',
//       // 'icon': Icon(Icons.stop),
//     },
//     {
//       'value': 'Female',
//       'label': 'Female',
//       // 'icon': Icon(Icons.fiber_manual_record),
//       // 'textStyle': TextStyle(color: Colors.red),
//     },
//     {
//       'value': 'others',
//       'label': 'others',
//       // 'enable': false,
//       // 'icon': Icon(Icons.grade),
//     },
//   ];
//   fun() async {
//     final String url = "http://192.168.1.23:3300/register";

//     final response = await http.get(Uri.parse(url));
//     var details = json.decode(response.body);
//     // print(details);
//     // print(details['result'].length);
//     // print(details['result'][0]['user_name']);
//     // print(details['result'][5]['user_name']);
//     var use = "balaj";

//     for (int i = 0; i <= details['result'].length; i++) {
//       if (use == details['result'][i]['user_name']) {
//         var c = details['result'][i]['user_name'];
//         print(c + 'hello');
//         print('correct');
//         // break;
//       } else {
//         print('wrong');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           // height: MediaQuery.of(context).size.height,
//           // width: MediaQuery.of(context).size.width,
//           child: Column(
//         children: [
//           Container(
//               width: 150.0,
//               height: 150.0,
//               decoration: BoxDecoration(
//                   color: Colors.blue,
//                   image: DecorationImage(
//                       image: NetworkImage(''), fit: BoxFit.cover),
//                   borderRadius: BorderRadius.all(Radius.circular(75.0)),
//                   boxShadow: [
//                     BoxShadow(blurRadius: 7.0, color: Colors.black)
//                   ])),
//           Container(
//             child: Flexible(
//               child: SingleChildScrollView(
//                 child: Container(
//                   child: Column(
//                     children: [
//                       TextFormField(
//                           enabled: false,
//                           controller: a,
//                           // onChanged: (text) {
//                           //   users.text =
//                           //       "" != null ? '${widget.user}' : "hello";
//                           // },

//                           decoration: InputDecoration(
//                               icon: Icon(Icons.verified_user,
//                                   color: Colors.black),
//                               hintText: "username",
//                               hintStyle: TextStyle(color: Colors.black))),
//                       SizedBox(height: 20.0),
//                       TextFormField(
//                           controller: b,
//                           decoration: InputDecoration(
//                               icon: Icon(Icons.person, color: Colors.black),
//                               hintText: "Email",
//                               hintStyle: TextStyle(color: Colors.black))),
//                       SizedBox(height: 20.0),
//                       TextFormField(
//                           controller: c,
//                           decoration: InputDecoration(
//                               icon: Icon(Icons.person, color: Colors.black),
//                               hintText: "First_name",
//                               hintStyle: TextStyle(color: Colors.black))),
//                       SizedBox(height: 20.0),
//                       TextFormField(
//                           controller: d,
//                           decoration: InputDecoration(
//                               icon: Icon(Icons.person, color: Colors.black),
//                               hintText: "Last_name",
//                               hintStyle: TextStyle(color: Colors.black))),
//                       SizedBox(height: 20.0),
//                       TextFormField(
//                           controller: e,
//                           decoration: InputDecoration(
//                               icon: Icon(Icons.date_range_rounded,
//                                   color: Colors.black),
//                               hintText: "Date of Birth",
//                               hintStyle: TextStyle(color: Colors.black))),
//                       SizedBox(height: 20.0),
//                       // SelectFormField(
//                       //   icon: Icon(Icons.people, color: Colors.black),
//                       //   labelText: 'Gender',
//                       //   changeIcon: true,
//                       //   dialogTitle: 'Pick a item',
//                       //   dialogCancelBtn: 'CANCEL',
//                       //   enableSearch: true,
//                       //   dialogSearchHint: 'Search item',
//                       //   items: _items,
//                       // ),
//                       // SizedBox(height: 20.0),
//                       TextFormField(
//                           controller: f,
//                           decoration: InputDecoration(
//                               icon:
//                                   Icon(Icons.star_border, color: Colors.black),
//                               hintText: "Religion",
//                               hintStyle: TextStyle(color: Colors.black))),
//                       SizedBox(height: 20.0),
//                       TextFormField(
//                           controller: g,
//                           decoration: InputDecoration(
//                               icon: Icon(Icons.person, color: Colors.black),
//                               hintText: "Surname",
//                               hintStyle: TextStyle(color: Colors.black))),
//                       SizedBox(height: 20.0),
//                       TextFormField(
//                           controller: h,
//                           decoration: InputDecoration(
//                               icon: Icon(Icons.person, color: Colors.black),
//                               hintText: "Surname",
//                               hintStyle: TextStyle(color: Colors.black))),
//                       SizedBox(height: 20.0),
//                       // SelectFormField(
//                       //   icon: Icon(Icons.people, color: Colors.black),
//                       //   labelText: 'Bloodgroup',
//                       //   changeIcon: true,
//                       //   dialogTitle: 'Pick a item',
//                       //   dialogCancelBtn: 'CANCEL',
//                       //   enableSearch: true,
//                       //   dialogSearchHint: 'Search item',
//                       //   items: _items,
//                       // ),
//                       // SelectFormField(
//                       //   icon: Icon(Icons.settings, color: Colors.black),
//                       //   labelText: 'Bloodgroup',
//                       //   changeIcon: true,
//                       //   dialogTitle: 'Pick a item',
//                       //   dialogCancelBtn: 'CANCEL',
//                       //   enableSearch: true,
//                       //   dialogSearchHint: 'Search item',
//                       //   items: _items,
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => LandingPage()));
//               },
//               child: Text("Save"))
//         ],
//       )),
//     );
//   }
// }
}
