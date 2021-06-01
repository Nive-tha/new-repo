import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google/LoginPage/reg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:cool_alert/cool_alert.dart';

import 'Alert.dart';
import 'AlertRegister.dart';

class Register1 extends StatefulWidget {
  Register1({this.faceBookReceived, this.googleReceived, this.empty});
  var faceBookReceived;
  var googleReceived;
  var empty;
  var saveKeyGoogle = "";
  var saveKeyFacebook = "";

  @override
  _Register1State createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  bool _selected = false;
  bool securetext = true;
  bool securetext1 = true;

  @override
  void initState() {

    super.initState();
  }
  var saveKeyGoogle = "";
  var saveKeyFacebook = "";


  var username = TextEditingController();
  var email = TextEditingController();
  var mblno = TextEditingController();
  var password = TextEditingController();
  var confirmpassword = TextEditingController();
  var familyid = TextEditingController();
  var familyname = TextEditingController();
  var google = TextEditingController();
  var facebook = TextEditingController();

  Future _read(a, b, c, d, g, e, f, k, i) async {
// print('func');

    //

    final String url =
        "http://ee2a3fd63a82.ngrok.io/parampara/new_registration";
    final response = await http.post(Uri.parse(url), body: {
      'user_name': a,
      'email': b,
      'phone': c,
      if (d == e)
        'pass': d,
      'family_name': f,
      'family_id': g,
      'google_id': k,
      'face_book': i,
    });
    print(response);
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
      // ignore: unnecessary_statements

      final String responseString = response.body;
      // final String name = responstring[]
      print(responseString);
      print(response);
      print(response.body);
      print(response.statusCode);


      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AlertReg()));

    }
   else{
     Navigator.push(context, MaterialPageRoute(builder: (context) => Alert()));
    }
    // _onCustomAnimationAlertPressed(context);
  }


  @override
  Widget build(BuildContext context) {
    if (widget.faceBookReceived == null && widget.googleReceived == null) {
      print("hello empty");
      print(widget.faceBookReceived);
      print(widget.googleReceived);

      // username.text = widget.empty;
      // email.text = widget.empty;
    } else if (widget.faceBookReceived == null && widget.empty == null) {
      print("hello google");
      google.text = widget.googleReceived.uid;
      username.text = widget.googleReceived.displayName;
      email.text = widget.googleReceived.email;
    } else if (widget.empty == null && widget.googleReceived == null) {
      print("hello facebook");
      print(widget.faceBookReceived);

      facebook.text = widget.faceBookReceived['id'];
      username.text = widget.faceBookReceived['name'];
      email.text = widget.faceBookReceived['email'];
    } else {
      print("nothing worked");
    }
    //
    //
    print(widget.googleReceived);
    print(widget.faceBookReceived);
    final _formKey = GlobalKey<FormState>();
    return Scaffold(

        body: SingleChildScrollView(
            child: Column(children: [
              Container(
                color: Colors.teal,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Image.asset('assets/Register.png'),
                  ],
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Create Account",
                        style: TextStyle(
                            color: Color(0xFF00695C),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: 300,
                        child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter username";
                              }
                            },
                            controller: username,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.teal[50],
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide:
                                  BorderSide(color: Colors.teal.shade50, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                prefixIcon: Icon(Icons.person, color: Colors.teal),
                                hintText: "UserName",
                                hintStyle: TextStyle(color: Colors.black54))),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 300,
                        child: TextFormField(
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return "please enter email";
                            //   }
                            // },
                            controller: email,

                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.teal[50],
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide:
                                  BorderSide(color: Colors.teal.shade50, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                prefixIcon: Icon(Icons.mail, color: Colors.teal),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.black54))),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 300,
                        child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter MobileNumber";
                              }
                            },
                            controller: mblno,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.teal[50],
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide:
                                  BorderSide(color: Colors.teal.shade50, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                prefixIcon: Icon(Icons.phone, color: Colors.teal),
                                hintText: "MobileNumber",
                                hintStyle: TextStyle(color: Colors.black54))),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 300,
                        child: TextFormField(
                          obscureText: securetext,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter password";
                              }
                            },
                            controller: password,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                color: Colors.teal,
                                icon: securetext
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: (){
                                  setState(() {
                                    securetext =!securetext;
                                  });
                                },
                              ),
                                filled: true,
                                fillColor: Colors.teal[50],
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide:
                                  BorderSide(color: Colors.teal.shade50, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                prefixIcon: Icon(Icons.lock, color: Colors.teal),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.black54))),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 300,
                        child: TextFormField(
                            obscureText: securetext1,
                            controller: confirmpassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter repassword";
                              }
                              if (password.text != confirmpassword.text) {
                                return "password do not match";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  color: Colors.teal,
                                  icon: securetext1
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onPressed: (){
                                    setState(() {
                                      securetext1 =!securetext1;
                                    });
                                  },
                                ),
                                filled: true,
                                fillColor: Colors.teal[50],
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide:
                                  BorderSide(color: Colors.teal.shade50, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                prefixIcon: Icon(Icons.lock, color: Colors.teal),
                                hintText: "ConfirmPassword",
                                hintStyle: TextStyle(color: Colors.black54))),
                      ),
                      SizedBox(height: 20),

                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Existing FamilyMember'),
                        value: _selected,
                        onChanged: (value) => setState(() => _selected = value!),
                      ),
                      if (!_selected)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Container(
                            // height: MediaQuery.of(context).size.height * 0.6,
                            width: 300,
                            child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter Familyname";
                                  }
                                },
                                controller: familyname,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.teal[50],
                                    // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                      borderSide: BorderSide(
                                          color: Colors.teal.shade50, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                      borderSide: BorderSide(color: Colors.teal),
                                    ),
                                    prefixIcon:
                                    Icon(Icons.person_add, color: Colors.teal),
                                    hintText: "FamilyName",
                                    hintStyle: TextStyle(color: Colors.black54))),
                          ),
                        ),
                      if (_selected)
                        Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Container(
                            // height: MediaQuery.of(context).size.height * 0.6,
                            width: 300,
                            child: TextField(
                                controller: familyid,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.teal[50],
                                    // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                      borderSide: BorderSide(
                                          color: Colors.teal.shade50, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                      borderSide: BorderSide(color: Colors.teal),
                                    ),
                                    prefixIcon:
                                    Icon(Icons.person_add, color: Colors.teal),
                                    hintText: "FamilyID",
                                    hintStyle: TextStyle(color: Colors.black54))),
                          ),
                        ),
                      SizedBox(height: 30),
                      RaisedButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        color: Color.alphaBlend(Colors.teal, Colors.teal),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final String a = username.text;
                            final String b = email.text;
                            final String c = mblno.text;
                            final String d = password.text;
                            final String e = confirmpassword.text;
                            final String f = familyname.text;
                            final String g = familyid.text;
                            final String k = google.text;
                            final String i = facebook.text;
                            _selected = false;
                            _read(a, b, c, d, g, e, f, k, i);

                          } else {
                            print("unsuccessful");
                          }
                        },
                        child: Text("SignUp"),
                      )
                    ],
                  ))
            ])));
  }
}
