import 'package:flutter/material.dart';
import 'package:google/tabspages/homescreen.dart';
import 'package:google/treepage/tree1.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Useraccount.dart';
import '../map.dart';
import 'contactdetail.dart';

class ProfessionalDetails extends StatefulWidget {
  const ProfessionalDetails({Key? key}) : super(key: key);

  @override
  _ProfessionalDetailsState createState() => _ProfessionalDetailsState();
}

class _ProfessionalDetailsState extends State<ProfessionalDetails> {
  void initState() {
    // TODO: implement initState
    super.initState();
    save();
  }

  var receiverPic;
  var nive;
  save() async {
    SharedPreferences get = await SharedPreferences.getInstance();
    receiverPic = get.getStringList('pic');
    print(receiverPic[0]);

    setState(() {
      nive = receiverPic[0];
    });

    print(34);
  }

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[HexColor('#0A4E51'), HexColor('#149BA1')])),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ContactDetails()));
              },
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Back",
                    style: TextStyle(color: Colors.white),
                  ))),
        ],
        title: Text(
          "Professional Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('$nive'),
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
        height: sizeHeight,
        width: sizeWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  child: Column(
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 150),
                    child: Text("Professional Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                        decoration: InputDecoration(
                      icon: Image.asset(
                        'assets/cerficate.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        borderSide:
                            BorderSide(color: HexColor('#0A4E51'), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        borderSide:
                            BorderSide(color: HexColor('#0A4E51'), width: 1),
                      ),
                      labelText: "Qualification",
                    )),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                        decoration: InputDecoration(
                      icon: Image.asset(
                        'assets/school.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        borderSide:
                            BorderSide(color: HexColor('#0A4E51'), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        borderSide:
                            BorderSide(color: HexColor('#0A4E51'), width: 1),
                      ),
                      labelText: "University/Institute",
                    )),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                        decoration: InputDecoration(
                      icon: Image.asset(
                        'assets/course.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        borderSide:
                            BorderSide(color: HexColor('#0A4E51'), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        borderSide:
                            BorderSide(color: HexColor('#0A4E51'), width: 1),
                      ),
                      labelText: "Course",
                    )),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                        decoration: InputDecoration(
                      icon: Image.asset(
                        'assets/portfolio.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        borderSide:
                            BorderSide(color: HexColor('#0A4E51'), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        borderSide:
                            BorderSide(color: HexColor('#0A4E51'), width: 1),
                      ),
                      labelText: "Working as a",
                    )),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                        decoration: InputDecoration(
                      icon: Image.asset(
                        'assets/office-building.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        borderSide:
                            BorderSide(color: HexColor('#0A4E51'), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        borderSide:
                            BorderSide(color: HexColor('#0A4E51'), width: 1),
                      ),
                      labelText: "Company Name",
                    )),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                        decoration: InputDecoration(
                      icon: Image.asset(
                        'assets/location.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        borderSide:
                            BorderSide(color: HexColor('#0A4E51'), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        borderSide:
                            BorderSide(color: HexColor('#0A4E51'), width: 1),
                      ),
                      labelText: "Company Location",
                    )),
                  ),
                  SizedBox(height: 150),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                        color: HexColor('#0A4E51'),
                        height: 50,
                        width: sizeWidth * 0.7,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ))),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
