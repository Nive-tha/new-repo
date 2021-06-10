import 'package:flutter/material.dart';
class Alert extends StatefulWidget {
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:Text("Connection failed.."),
      content: Text("Server Not Found !!"),
      actions:<Widget>[
      FlatButton(onPressed: (){
        Navigator.of(context).pop();
    }, child: Text('ok'))
      ],
    );
  }
}
