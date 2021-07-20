import 'package:flutter/material.dart';
import 'package:googleandfacebook/home_page/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var setNameFacebook = "";
  var setNameGoogle = "";
  var u = TextEditingController();
  var e = TextEditingController();
  var p = TextEditingController();
  var pa = TextEditingController();
  var f = TextEditingController();
  var g = TextEditingController();
  var fa = TextEditingController();
  var fam = TextEditingController();

  @override
  void initState() {
    gettingHereFromFacebook();
    super.initState();
  }

  gettingHereFromFacebook() async {
    SharedPreferences get = await SharedPreferences.getInstance();
    u.text = get.getString(setNameFacebook);
    print(u.text);
    print(setNameFacebook);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            // height: double.infinity,
            //   width:double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.cyan,
                  Colors.cyan,
                  Colors.cyan,
                  Colors.cyan,
                ])),
            child: Center(
              child: new Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  TextFormField(
                      controller: u,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person, color: Colors.white),
                          hintText: "UserId",
                          hintStyle: TextStyle(color: Colors.white))),
                  SizedBox(height: 10),
                  TextFormField(
                      controller: e,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person, color: Colors.white),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white))),
                  SizedBox(height: 10),
                  TextFormField(
                      controller: p,
                      decoration: InputDecoration(
                          icon: Icon(Icons.mail, color: Colors.white),
                          hintText: "Phone",
                          hintStyle: TextStyle(color: Colors.white))),
                  SizedBox(height: 10),
                  TextFormField(
                      controller: pa,
                      decoration: InputDecoration(
                          icon: Icon(Icons.mail, color: Colors.white),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white))),
                  SizedBox(height: 10),
                  TextFormField(
                      controller: f,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock, color: Colors.white),
                          hintText: "FCM_TOKEN",
                          hintStyle: TextStyle(color: Colors.white))),
                  SizedBox(height: 10),
                  TextFormField(
                      controller: g,
                      decoration: InputDecoration(
                          icon: Icon(Icons.mail, color: Colors.white),
                          hintText: "GoogleID",
                          hintStyle: TextStyle(color: Colors.white))),
                  SizedBox(height: 10),
                  TextFormField(
                      controller: fa,
                      decoration: InputDecoration(
                          icon: Icon(Icons.mail, color: Colors.white),
                          hintText: "FACEBOOK",
                          hintStyle: TextStyle(color: Colors.white))),
                  SizedBox(height: 10),
                  TextFormField(
                      controller: fam,
                      decoration: InputDecoration(
                          icon: Icon(Icons.mail, color: Colors.white),
                          hintText: "FamilyID",
                          hintStyle: TextStyle(color: Colors.white))),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.cyan,
                          Colors.cyan,
                          Colors.cyan,
                          Colors.cyan,
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              child: Text('Register'),
                              onPressed: () {
                                print('hello');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePageMain()));
                              }),
                        ),
                        ElevatedButton(onPressed: () {}, child: Text('read')),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('profile'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
