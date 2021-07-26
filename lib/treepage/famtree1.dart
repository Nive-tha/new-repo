import 'package:flutter/material.dart';
import 'package:google/LoginPage/Profile.dart';
import 'package:google/LoginPage/personaldetails.dart';
import 'package:google/tabspages/home.dart';
import 'package:google/tabspages/homescreen.dart';
import 'package:google/treepage/tree1.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Useraccount.dart';
import '../map.dart';

class FamTree extends StatefulWidget {
  const FamTree({Key? key}) : super(key: key);

  @override
  _FamTreeState createState() => _FamTreeState();
}

class _FamTreeState extends State<FamTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[HexColor('#0A4E51'), HexColor('#149BA1')])),
        ),
        backgroundColor: Colors.teal,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          FlatButton(
            padding: EdgeInsets.zero,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Back',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ),
            onPressed: () {
             
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen()));
            },
          )
        ],
        title: Text(
          'Add Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Nive"),
              accountEmail: Text(""),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.teal[400],
                child: Text("Hi"),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              leading: Image.asset('assets/homeicon.png'),
              title: Text("Home", style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              leading: Image.asset('assets/message.png'),
              title: Text("Message", style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Tree1()));
              },
              leading: Image.asset('assets/treee.png'),
              title: Text("Family Tree",
                  style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyLocation()));
              },
              leading: Image.asset('assets/mapicon.png'),
              title: Text(
                "Location",
                style: TextStyle(color: Colors.teal[800]),
              ),
            ),
            Divider(height: 10.0, color: Colors.transparent),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Check1()));
              },
              leading: Image.asset('assets/accounticon.png'),
              title: Text("Account", style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              leading: Image.asset('assets/logoutt.png'),
              title: Text("Logout", style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
          ],
        ),
      ),
      body: Container(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Profiles()));
          },
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.person_add), Text("Add You in Tree")],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
