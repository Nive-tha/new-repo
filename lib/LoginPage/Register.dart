import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:google/LoginPage/Landingpage.dart';
import 'Mail.dart';
// import 'package:parampara_login_reg/profile.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // String _baseUrl = "http://192.168.1.23:3300/register";

  // Map listDatas = {
  //   'user_name' : u.text,
  //   'email' : e.text,
  //   'phone' : p.text,
  //   'pass' : pa.text,
  //   'fcm_token' : f.text,
  //   'google_id' : g.text,
  //   'face_book' : fa.text,
  //   'family_id' : fam.text
  // };
  // final prefs = await SharedPreferences.getInstance();
  // final key = 'my_int_key';
  // String name = user_name.text;
  // String mail = email.text;
  // String Phone = phone.text;
  // String fcm= fcm_token.text;
  // String google =google_id.text;
  // String facebook = face_book.text;
  // String familyid =  family_id.text;
  //   var response = await http.post(Uri.parse(_baseUrl),body:'${listDatas}');
  //   print('${listDatas}');
  //   // final value = prefs.getString(key);
  //   // print(value);
  //   // print(key);
  //   // print(prefs);
  //   // print('read: $name+$mail+$Phone+$fcm+$google+$facebook+$familyid');print (response);
  //   print (response);
  // }
  // String name;
  // String mail; int Phone; String password; String fcm; String google ; String facebook; int familyid;

  var u = TextEditingController();
  var e = TextEditingController();
  var p = TextEditingController();
  var pa = TextEditingController();
  var f = TextEditingController();
  var g = TextEditingController();
  var fa = TextEditingController();
  var fam = TextEditingController();

  // String a;

  Future _save(a, b, c) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    String user_name = a;
    String email = b;
    String phone = c;
    // print(user_name);
    final v = prefs.setString(key, 'USER_ID:$user_name,$email,$phone');


  }
    //   final String url = "http://192.168.1.23:3300/register";
    //
    //   final response = await http.post(Uri.parse(url), body: {
    //     'user_name': a,
    //     // 'email': b,
    //     // 'phone': c,
    //     // 'pass': d,
    //     // 'fcm_token': ef,
    //     // 'google_id': gh,
    //     // 'face_book': i,
    //     // 'family_id': j
    //   });
    //   if (response.statusCode == 200) {
    //     final String responseString = response.body;
    //     // final String name = responstring[]
    //     print(responseString);
    //     print(response);
    //     print(response.body);
    //     print(response.statusCode);
    //   }
    // }

    Future _read(a, b, c, d, ef, gh, i, j) async {
      final String url = "http://192.168.1.23:3300/register";

      final response = await http.post(Uri.parse(url), body: {
        'user_name': a,
        'email': b,
        'phone': c,
        'pass': d,
        'fcm_token': ef,
        'google_id': gh,
        'face_book': i,
        'family_id': j
      });
      final String bUrl = "http://192.168.1.23:3300/register/family";
      final bull = await http
          .post(Uri.parse(bUrl), body: {'family_id': j, 'family_name': b});

      print(bull);
      if (bull.statusCode == 200) {
        final String name = bull.body;
        print(name);
      }
      print(u.text);
      print(response);

      if (response.statusCode == 200) {
        final String responseString = response.body;
        // final String name = responstring[]
        print(responseString);
        print(response);
        print(response.body);
        print(response.statusCode);
      }
    }

// // if(response == 200){
// //   prin
// // }
//   }
//   Future _func(a) {
//     print(a);
//   }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Register"),
          ),
          body: ListView(
            children: [
              Container(
                // height: double.infinity,
                //   width:double.infinity,
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
                  child: new Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      TextFormField(
                          controller: u,
                          decoration: InputDecoration(
                              icon: Icon(Icons.person, color: Colors.white),
                              hintText: "UserId",
                              hintStyle: TextStyle(color: Colors.white))),
                      SizedBox(height: 10),
                      TextFormField(
                          controller: e,
                          decoration: InputDecoration(
                              icon: Icon(Icons.person, color: Colors.white),
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.white))),
                      SizedBox(height: 10),
                      TextFormField(
                          controller: p,
                          decoration: InputDecoration(
                              icon: Icon(Icons.mail, color: Colors.white),
                              hintText: "Phone",
                              hintStyle: TextStyle(color: Colors.white))),
                      SizedBox(height: 10),
                      TextFormField(
                          controller: pa,
                          decoration: InputDecoration(
                              icon: Icon(Icons.mail, color: Colors.white),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.white))),
                      SizedBox(height: 10),
                      TextFormField(
                          controller: f,
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock, color: Colors.white),
                              hintText: "FCM_TOKEN",
                              hintStyle: TextStyle(color: Colors.white))),
                      SizedBox(height: 10),
                      TextFormField(
                          controller: g,
                          decoration: InputDecoration(
                              icon: Icon(Icons.mail, color: Colors.white),
                              hintText: "GoogleID",
                              hintStyle: TextStyle(color: Colors.white))),
                      SizedBox(height: 10),
                      TextFormField(
                          controller: fa,
                          decoration: InputDecoration(
                              icon: Icon(Icons.mail, color: Colors.white),
                              hintText: "FACEBOOK",
                              hintStyle: TextStyle(color: Colors.white))),
                      SizedBox(height: 10),
                      TextFormField(
                          controller: fam,
                          decoration: InputDecoration(
                              icon: Icon(Icons.mail, color: Colors.white),
                              hintText: "FamilyID",
                              hintStyle: TextStyle(color: Colors.white))),
                      SizedBox(height: 10),
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
                        child:
                        // ButtonTheme(
                        //       buttonColor: Colors.white10,
                        //       // height: 50.0,
                        //       minWidth: double.infinity,
                        //       child: ElevatedButton(
                        //         child: Text('Register'),
                        //         onPressed: null,
                        //       ),
                        //     )),
                        // SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                child: Text('Register'),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => Mail()));
                                  final String a = u.text;
                                  final String b = e.text;
                                  final String c = p.text.toString();
                                  final String d = pa.text;
                                  final String ef = f.text;
                                  final String gh = g.text;
                                  final String i = fa.text;
                                  final String j = fam.text.toString();
                                  // print(a);
                                  // _func(a);

                                  _read(
                                      a,
                                      b,
                                      c,
                                      d,
                                      ef,
                                      gh,
                                      i,
                                      j);
                                },

                                // print(user);
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: ElevatedButton(
                            //     child: Text('Save'),
                            //     onPressed: null,
                            //   ),
                            // ),


                            ElevatedButton(
                                onPressed: () async {
                                  final String url =
                                      "http://192.168.1.23:3300/register";
                                  final res = await http.get(Uri.parse(url));
                                  var people = json.decode(res.body);
                                  // print(people);
                                  // print(people['result']['user_name']);
                                  print(people['result'][0]['user_name']);
                                },
                                child: Text('read')),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            final String a = u.text;
                            // print(a);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    // Profile(user: u.text)
                                    Mail()));
                          },
                          child: Text('profile'))
                    ],
                  ),


                ),
              ),
              ElevatedButton(onPressed: () {
                final String a = u.text;
                final String b= e.text;
                final String c= p.text;
                _save(a, b, c);
              },
                child: Text('save'),),
              SizedBox(height: 30),
              // ElevatedButton(onPressed: _func, child: Text('read'),),

            ],
          ));
    }
  }
// _func() async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'my_int_key';
//     final String user_name = u.text;
//
//     final value = prefs.getString(key);
//     print(value);
//     // print(key);
//     // print(prefs);
//     print('read: $user_name');
//   }
//   _save() async {
//     final String url = "http://192.168.1.23:3300/user";
//     final response = await http.post(Uri.parse(url),body:{

//       "user_name": u.text,
//     });
//     print(response);
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'my_int_key';
//     String user_name = u.text;
//     print(user_name);
//     final v = prefs.setString(key, '$user_name');
//     // print(v);
//   }
// }

// Replace these two methods in the examples that follow

// _save() async {
//   final prefs = await SharedPreferences.getInstance();
//   final key = 'my_int_key';
//   String first = user_name.text;
//   String last = email.text;
//   String Email = phone.text;
//   String DOB = fcm_token.text;
//   String first = google_id.text;
//   String last = face_book.text;
//   String Email = family_id.text;
//
//   final v = prefs.setString(key, '$first,$last,$Email,$DOB');
//   print('saved $first');
//   print('$last');
//   print('$Email');
//   print('$DOB');
//   print(v);
// }
