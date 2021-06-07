import 'package:flutter/material.dart';

import 'Mail.dart';
class AlertReg extends StatefulWidget {
  @override
  _AlertRegState createState() => _AlertRegState();
}

class _AlertRegState extends State<AlertReg> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal,
      title:Text("Thank you"),
      content: Text("Registration Successful!!"),
      actions:<Widget>[
        FlatButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Mail()));
        }, child: Text('ok'))
      ],
    );
  }
}
