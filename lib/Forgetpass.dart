import 'dart:convert';
import 'package:flutter/material.dart';
import 'LoginPage/reg.dart';
import 'Reset.dart';
import 'package:http/http.dart' as http;

class ForgetPass extends StatefulWidget {
  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  var email = TextEditingController();
  var otp = TextEditingController();
  bool securetext = true;
  bool securetext1 = true;

  Future sendOtp(e) async {
    String url = 'http://ae53595c09a2.ngrok.io/parampara/forgot_pass';
    final response = await http.post(Uri.parse(url), body: {
      'email': e,
    });

    print(response);
    print(response.body);
  }

  Future verifyOtp(e, o) async {
    String url = 'http://ae53595c09a2.ngrok.io/parampara/compare_otp';
    final response =
        await http.post(Uri.parse(url), body: {'email': e, 'tempotp': o});
    print(response);
    print(response.body);
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ForgetPass1()));
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
                controller: otp,
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
                    hintText: "OTP",
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

              sendOtp(e);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Reset()));
            },
            child: Text("Send OTP"),
          ),
          SizedBox(height: 30),
          RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            color: Color.alphaBlend(Colors.teal, Colors.teal),
            onPressed: () {
              // ignore: unnecessary_statements
              final String e = email.text;
              final String o = otp.text;
              verifyOtp(e, o);
            },
            child: Text("Verify OTP"),
          )
        ],
      ))
    ])));
  }
}
