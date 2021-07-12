import 'package:flutter/material.dart';

import 'Forgetpass.dart';

class NewLog extends StatefulWidget {
    @override
  _NewLogState createState() => _NewLogState();
}

class _NewLogState extends State<NewLog> {
  bool _selected = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      color: Colors.teal[500],
      child: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: Text(
              "Sign In",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        SizedBox(height: 15),
                        Container(
                          width: 250,
                          height: 50,
                          child: TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please enter the username";
                                }
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.teal[110],
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16.0)),
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade300, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16.0)),
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade300, width: 1),
                                  ),
                                  prefixIcon: Icon(Icons.account_circle,
                                      color: Colors.white),
                                  hintText: "UserName or Email",
                                  hintStyle: TextStyle(color: Colors.white))),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: 250,
                          height: 50,
                          child: TextFormField(
                              controller: _otpController,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please enter the password";
                                }
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.teal[103],
                                  hintText: "Password",
                                  prefixIcon:
                                      Icon(Icons.lock, color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16.0)),
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade300, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16.0)),
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade300, width: 1),
                                  ),
                                  hintStyle: TextStyle(color: Colors.white))),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Theme(
                            data:
                                ThemeData(unselectedWidgetColor: Colors.white),
                            child: CheckboxListTile(
                              activeColor: Colors.teal[300],
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                'Remember me',
                                style: TextStyle(color: Colors.white),
                              ),
                              value: _selected,
                              onChanged: (value) =>
                                  setState(() => _selected = value!),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        FlatButton(
                          onPressed: () async {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          minWidth: 250,
                          height: 50,
                          color: Colors.lightBlue.shade900,
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new InkWell(
                                child: new Text(
                                  'Forget Password?',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onTap: () => Navigator.pushReplacement(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new ForgetPass())))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(children: <Widget>[
                          Expanded(
                              child: Container(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            child: Divider(
                              color: Colors.white,
                            ),
                          )),
                          Text(
                            "OR",
                            style: TextStyle(color: Colors.white),
                          ),
                          Expanded(
                              child: Container(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            child: Divider(
                              color: Colors.white,
                            ),
                          )),
                        ]),
                        SizedBox(height: 15),
                        FlatButton(
                          onPressed: () async {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            width: 230,
                            child: Row(
                              children: [
                                Image.asset('assets/google.jpeg',
                                    height: 30, width: 30),
                                Text(
                                  '   Continue with Google',
                                  style: TextStyle(
                                      color: Colors.lightBlue.shade900),
                                ),
                              ],
                            ),
                          ),
                          height: 50,
                          color: Colors.white,
                        ),
                        SizedBox(height: 15),
                        FlatButton(
                          onPressed: () async {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            width: 230,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/facebook.jpeg',
                                  height: 30,
                                  width: 30,
                                ),
                                Text(
                                  '   Continue with Facebook',
                                  style: TextStyle(
                                      color: Colors.lightBlue.shade900),
                                ),
                              ],
                            ),
                          ),
                          height: 50,
                          color: Colors.white,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Don't Have an account? Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ])),
                ],
              )),
        ],
      ),
    ));
  }
}
