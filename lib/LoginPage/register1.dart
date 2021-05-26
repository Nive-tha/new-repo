import 'package:flutter/material.dart';
import 'package:google/LoginPage/reg.dart';

class Register1 extends StatefulWidget {
  Register1({Key? key}) : super(key: key);

  @override
  _Register1State createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  bool _selected = false;
  @override
  void initState() {
    _selected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
        color: Colors.teal,
        child: Column(
          children: [
            SizedBox(height: 30),
            Image.asset('assets/Register.png'),
          ],
        ),
      ),
      Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Create Account",
            style: TextStyle(
                color: Color(0xFF00695C),
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat"),
          ),
          SizedBox(height: 15),
          Container(
            width: 300,
            child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.teal[50],
                    // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      borderSide:
                          BorderSide(color: Colors.teal.shade50, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.teal),
                    hintText: "UserName",
                    hintStyle: TextStyle(color: Colors.black54))),
          ),
          SizedBox(height: 20),
          Container(
            width: 300,
            child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.teal[50],
                    // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      borderSide:
                          BorderSide(color: Colors.teal.shade50, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    prefixIcon: Icon(Icons.mail, color: Colors.teal),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black54))),
          ),
          SizedBox(height: 20),
          Container(
            width: 300,
            child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.teal[50],
                    // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      borderSide:
                          BorderSide(color: Colors.teal.shade50, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    prefixIcon: Icon(Icons.phone, color: Colors.teal),
                    hintText: "MobileNumber",
                    hintStyle: TextStyle(color: Colors.black54))),
          ),
          SizedBox(height: 20),
          Container(
            width: 300,
            child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.teal[50],
                    // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      borderSide:
                          BorderSide(color: Colors.teal.shade50, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.teal),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black54))),
          ),
          SizedBox(height: 20),
          Container(
            width: 300,
            child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.teal[50],
                    // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      borderSide:
                          BorderSide(color: Colors.teal.shade50, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.teal),
                    hintText: "ConfirmPassword",
                    hintStyle: TextStyle(color: Colors.black54))),
          ),
          SizedBox(height: 20),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('Existing FamilyMember'),
            value: _selected,
            onChanged: (value) => setState(() => _selected = value!),
          ),
          if (!_selected)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.6,
                width: 300,
                child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.teal[50],
                        // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide:
                              BorderSide(color: Colors.teal.shade50, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        prefixIcon: Icon(Icons.person_add, color: Colors.teal),
                        hintText: "FamilyName",
                        hintStyle: TextStyle(color: Colors.black54))),
              ),
            ),
          if (_selected)
            Padding(
              // padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.6,
                width: 300,
                child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.teal[50],
                        // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide:
                              BorderSide(color: Colors.teal.shade50, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        prefixIcon: Icon(Icons.person_add, color: Colors.teal),
                        hintText: "FamilyID",
                        hintStyle: TextStyle(color: Colors.black54))),
              ),
            ),
          SizedBox(height: 30),
          RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            color: Color.alphaBlend(Colors.teal, Colors.teal),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Reg()));
            },
            child: Text("SignUp"),
          )
        ],
      )
    ])));
  }
}
