import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:parampara_login_reg/profile.dart';
import 'package:parampara_login_reg/main.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final prefs = SharedPreferences.getInstance();
  var u = TextEditingController();
  var e = TextEditingController();
  var p = TextEditingController();
  var pa = TextEditingController();
  var f = TextEditingController();
  var g = TextEditingController();
  var fa = TextEditingController();
  var fam = TextEditingController();
  String a;
  func() {
    var abc = prefs;
    print(abc);
  }

  Future _save(a) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    String userName = a;
    // print(user_name);
    final v = prefs.setString(key, '$userName');

    print(v);

    final String url = "http://8f6260f78ed0.ngrok.io/user";

    final response = await http.post(Uri.parse(url), body: {
      'user_name': a,
      // 'email': b,
      // 'phone': c,
      // 'pass': d,
      // 'fcm_token': ef,
      // 'google_id': gh,
      // 'face_book': i,
      // 'family_id': j
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      // final String name = responstring[]
      print(responseString);
      print(response);
      print(response.body);
      print(response.statusCode);
    }
  }

  Future _read(a, b, c, d, ef, gh, i, j) async {
    final String url = "http://50cbb3f642ab.ngrok.io/register";

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
    // final String bUrl = "http://192.168.1.23:3300/register/family";
    // final bull = await http
    //     .post(Uri.parse(bUrl), body: {'family_id': j, 'family_name': b});

    // print(bull);
    // if (bull.statusCode == 200) {
    //   final String name = bull.body;
    //   print(name);
    // }
    // print(u.text);
    // print(response);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      // final String name = responstring[]
      print(responseString);
      print(response);
      print(response.body);
      print(response.statusCode);
    }
  }

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
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Colors.purple[700],
                    Colors.purple[600],
                    Colors.purple[400],
                    Colors.purple[200],
                  ])),
              child: Center(
                child: new Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    TextFormField(
                        controller: u,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person, color: Colors.white),
                            hintText: "UserName",
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
                            Colors.purple[700],
                            Colors.purple[600],
                            Colors.purple[400],
                            Colors.purple[200],
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: Text('Register'),
                              onPressed: () {
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

                                _read(a, b, c, d, ef, gh, i, j);
                              },

                              // print(user);
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                // final String url =
                                //     "http://192.168.1.23:3300/register";
                                // final res = await http.get(Uri.parse(url));
                                // var people = json.decode(res.body);
                                // // print(people);
                                // // print(people['result']['user_name']);
                                // print(people['result'][0]['user_name']);
                              },
                              child: Text('read')),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          final String a = u.text;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                        },
                        child: Text('profile'))
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final String a = u.text;
                _save(a);
              },
              child: Text('save'),
            ),
            SizedBox(height: 30),
            // ElevatedButton(onPressed: _func, child: Text('read'),),
          ],
        ));
  }
}
