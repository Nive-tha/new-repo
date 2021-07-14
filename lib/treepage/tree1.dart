import 'package:flutter/material.dart';

class Tree1 extends StatefulWidget {
  const Tree1({Key? key}) : super(key: key);

  @override
  _Tree1State createState() => _Tree1State();
}

class _Tree1State extends State<Tree1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal[800],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.account_circle,
              size: 50.0,
              color: Colors.white,
            ),
            Text("FamilyTree",style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize:30)),
            Text("Back",style:TextStyle(color:Colors.white,fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
