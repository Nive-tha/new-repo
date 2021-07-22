import 'package:flutter/material.dart';
import 'package:google/tabspages/homescreen.dart';
import 'package:google/treepage/tree1.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Useraccount.dart';
import '../map.dart';
import 'package:google/LoginPage/contactdetail.dart';

class Profiles extends StatefulWidget {
  const Profiles({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profiles> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // save();
  }

// var receiverFromRegister1;
  var nive;
  var nive1;
  var receiverPic;
  var extractedDetail;
  var radioButtonItem;
  var id;

  var receiverFromRegister1;

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Tree1()));
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 140, top: 20),
                child: Text(
                  "Add Personal Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 20),
                child: Stack(children: [
                  Image.asset(
                    'assets/profile.png',
                    width: 100,
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, top: 70),
                    child: SvgPicture.asset('assets/camera.svg'),
                  )
                ]),
              ),
              SizedBox(height: 20),
              Container(
                  child: Form(
                      child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 10),
                    child: Text(
                      "Upload Your Photo",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Radio(
                              activeColor: HexColor("#0A4E51"),
                              value: 1,
                              groupValue: id,
                              onChanged: (val) {
                                setState(() {
                                  radioButtonItem = 'Male';
                                  id = 1;
                                });
                              },
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              child: SvgPicture.asset('assets/male.svg'),
                            ),
                            Text(
                              '  Male',
                              style: new TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Radio(
                              activeColor: HexColor("#0A4E51"),
                              value: 2,
                              groupValue: id,
                              onChanged: (val) {
                                setState(() {
                                  radioButtonItem = '';
                                  id = 2;
                                });
                              },
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              child: SvgPicture.asset('assets/female.svg'),
                            ),
                            Text(
                              '  Female',
                              style: new TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ]),
                  Container(
                    width: 300,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, top: 20),
                      child: TextFormField(
                          decoration: InputDecoration(
                              icon: Image.asset('assets/cake.png',
                                  width: 30, height: 40),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                                borderSide: BorderSide(
                                    color: HexColor("#0A4E51"), width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                                borderSide: BorderSide(
                                    color: HexColor("#0A4E51"), width: 2),
                              ),
                              // prefixIcon:
                              // Icon(Icons.account_circle, color: Colors.white),
                              labelText: "DD/MM/YYYY",
                              labelStyle: TextStyle(color: Colors.black45))),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, top: 20),
                      child: TextFormField(
                          decoration: InputDecoration(
                              icon: Image.asset('assets/religion.png',
                                  width: 30, height: 40),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                                borderSide: BorderSide(
                                    color: HexColor("#0A4E51"), width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                                borderSide: BorderSide(
                                    color: HexColor("#0A4E51"), width: 2),
                              ),
                              // prefixIcon:
                              // Icon(Icons.account_circle, color: Colors.white),
                              labelText: "Religion",
                              labelStyle: TextStyle(color: Colors.black45))),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, top: 20),
                      child: TextFormField(
                          decoration: InputDecoration(
                              icon: Image.asset('assets/Community.png',
                                  width: 30, height: 40),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                                borderSide: BorderSide(
                                    color: HexColor("#0A4E51"), width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                                borderSide: BorderSide(
                                    color: HexColor("#0A4E51"), width: 2),
                              ),
                              // prefixIcon:
                              // Icon(Icons.account_circle, color: Colors.white),
                              labelText: "Community",
                              labelStyle: TextStyle(color: Colors.black45))),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, top: 20),
                      child: TextFormField(
                          decoration: InputDecoration(
                              icon: Image.asset('assets/blood-type.png',
                                  width: 30, height: 40),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                                borderSide: BorderSide(
                                    color: HexColor("#0A4E51"), width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                                borderSide: BorderSide(
                                    color: HexColor("#0A4E51"), width: 1),
                              ),
                              // prefixIcon:
                              // Icon(Icons.account_circle, color: Colors.white),
                              labelText: "BloodGroup",
                              labelStyle: TextStyle(color: Colors.black45))),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      color: HexColor('#0A4E51'),
                      width: 270,
                      height: 50,
                      child: TextButton(
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ContactDetails()));
                        },
                      ),
                    ),
                  )
                ],
              ))),
            ],
          ),
        ),
      ),
    );
  }
}
