import 'package:flutter/material.dart';
import 'package:google/LoginPage/personaldetails.dart';
import 'package:google/LoginPage/professionaldetails.dart';
import 'package:google/tabspages/homescreen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Useraccount.dart';
import '../map.dart';

class ContactDetails extends StatefulWidget {
  const ContactDetails({Key? key}) : super(key: key);

  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  final List<Map<String, dynamic>> city = [
    {
      'value': '',
      'label': '',
    },
    {
      'value': '',
      'label': '',
    },
    {
      'value': '',
      'label': '',
    },
  ];
  void initState() {
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
                        builder: (BuildContext context) => Profiles()));
              },
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Back",
                    style: TextStyle(color: Colors.white),
                  ))),
        ],
        title: Text(
          "Contact Details",
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ContactDetails()));
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
                    padding: const EdgeInsets.only(right: 180),
                    child: Text("Contact Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                        decoration: InputDecoration(
                      icon: Image.asset(
                        'assets/smartphone.png',
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
                      labelText: "Mobile Number",
                    )),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                        decoration: InputDecoration(
                      icon: Image.asset(
                        'assets/whatsapp.png',
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
                      labelText: "Whatsapp Number",
                    )),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                        decoration: InputDecoration(
                      icon: Image.asset(
                        'assets/email.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(1.0)),
                        borderSide:
                            BorderSide(color: HexColor('#0A4E51'), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(1.0)),
                        borderSide:
                            BorderSide(color: HexColor('#0A4E51'), width: 1),
                      ),
                      labelText: "Email",
                    )),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                        decoration: InputDecoration(
                      icon: Image.asset(
                        'assets/house.png',
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
                      labelText: "Door No/House Name",
                    )),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                        decoration: InputDecoration(
                      icon: Image.asset(
                        'assets/street-sign.png',
                        width: 30,
                        height: 40,
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
                      labelText: "Street Name",
                    )),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 50,
                    child: SelectFormField(
                        changeIcon: true,
                        dialogTitle: 'Pick a item',
                        dialogCancelBtn: 'CANCEL',
                        enableSearch: true,
                        dialogSearchHint: 'Search item',
                        items: city,
                        decoration: InputDecoration(
                          icon: Image.asset(
                            'assets/shivangi.jpg',
                            width: 30,
                            height: 40,
                            fit: BoxFit.fill,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            borderSide: BorderSide(
                                color: HexColor('#0A4E51'), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            borderSide: BorderSide(
                                color: HexColor('#0A4E51'), width: 1),
                          ),
                          labelText: "City",
                        )),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 50,
                    child: SelectFormField(
                        changeIcon: true,
                        dialogTitle: 'Pick a item',
                        dialogCancelBtn: 'CANCEL',
                        enableSearch: true,
                        dialogSearchHint: 'Search item',
                        items: city,
                        decoration: InputDecoration(
                          icon: Image.asset(
                            'assets/empire-state.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.fill,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            borderSide: BorderSide(
                                color: HexColor('#0A4E51'), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            borderSide: BorderSide(
                                color: HexColor('#0A4E51'), width: 1),
                          ),
                          labelText: "State",
                        )),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 50,
                    child: SelectFormField(
                        changeIcon: true,
                        dialogTitle: 'Pick a item',
                        dialogCancelBtn: 'CANCEL',
                        enableSearch: true,
                        dialogSearchHint: 'Search item',
                        items: city,
                        decoration: InputDecoration(
                          icon: Image.asset(
                            'assets/world.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.fill,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            borderSide: BorderSide(
                                color: HexColor('#0A4E51'), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            borderSide: BorderSide(
                                color: HexColor('#0A4E51'), width: 1),
                          ),
                          labelText: "Country",
                        )),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                        color: HexColor('#0A4E51'),
                        height: 50,
                        width: sizeWidth * 0.7,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ProfessionalDetails()));
                            },
                            child: Text(
                              "Continue",
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
