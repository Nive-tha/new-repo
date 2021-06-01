import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google/LoginPage/Mail.dart';
import 'LoginPage/reg.dart';


import 'package:http/http.dart' as http;
class ForgetPass1 extends StatefulWidget {
  @override
  _ForgetPass1State createState() => _ForgetPass1State();
}

class _ForgetPass1State extends State<ForgetPass1> {

  var email = TextEditingController();
  var chotp = TextEditingController();
  var cootp = TextEditingController();
  bool securetext = true;
  bool securetext1 = true;




  Future verifyOtp(e,c,d) async {
    String url = 'http://ee2a3fd63a82.ngrok.io/parampara/changepass';
    final response =
    await http.post(Uri.parse(url), body: {'email': e ,'newpass' : c ,'conformpass': d });
    print(response);
    print(response.body);
    if(response.statusCode == 200){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Mail()));

    }

  }
  @override
  Widget build(BuildContext context) {
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

                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Forgot Password",
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
                            controller: chotp,
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
                                prefixIcon: Icon(Icons.lock, color: Colors.teal),
                                hintText: "New Password",
                                hintStyle: TextStyle(color: Colors.black54))),
                      ),





                      SizedBox(height: 30),
                      Container(
                        width: 300,
                        child: TextFormField(
                            obscureText: securetext,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter password";
                              }
                            },
                            controller: cootp,
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
                                prefixIcon: Icon(Icons.lock, color: Colors.teal),
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(color: Colors.black54))),
                      ),





                      SizedBox(height: 30),
                      RaisedButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        color: Color.alphaBlend(Colors.teal, Colors.teal),
                        onPressed: () {

                          final String e = email.text;
                          final String c = chotp.text;
                          final String d = cootp.text;
                          verifyOtp(e,c,d);
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => Reset()));
                        } ,

                        child: Text("Reset"),

                      ),

                    ],
                  ))
            ])));
  }
}
