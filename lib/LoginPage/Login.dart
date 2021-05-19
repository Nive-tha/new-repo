import 'package:flutter/material.dart';

import 'Mail.dart';
import 'Register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
class Log extends StatefulWidget {
  @override
  _LogState createState() => _LogState();
}

class _LogState extends State<Log> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
           children: [
        ElevatedButton(onPressed: ()
  {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Mail()));

  }
                , child: Text("Login")),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: ElevatedButton(onPressed: ()
                   {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                   }, child: Text("Register")),
             )
           ],
          ),
        ),
      ),
    );
  }
}
