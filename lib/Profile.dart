import 'package:faceauth/Landingpage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:select_form_field/select_form_field.dart';

// import 'package:parampara_login_reg/profile.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
class Profile extends StatefulWidget {
  Profile({required this.user});
  final String user;
  @override
  _ScrollState createState() => _ScrollState();
}

class _ScrollState extends State<Profile> {
  var a=TextEditingController();
  var b=TextEditingController();
  var c=TextEditingController();
  var d=TextEditingController();
  var e=TextEditingController();
  var f=TextEditingController();
  var g=TextEditingController();
  var h=TextEditingController();
  // var a1=TextEditingController();
  // var users = TextEditingController();

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Male',
      'label': 'Male',
      // 'icon': Icon(Icons.stop),
    },
    {
      'value': 'Female',
      'label': 'Female',
      // 'icon': Icon(Icons.fiber_manual_record),
      // 'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': 'others',
      'label': 'others',
      // 'enable': false,
      // 'icon': Icon(Icons.grade),
    },
  ];
  fun() async {
    final String url = "http://192.168.1.23:3300/register";

    final response = await http.get(Uri.parse(url));
    var details=json.decode(response.body);
    // print(details);
    // print(details['result'].length);
    // print(details['result'][0]['user_name']);
    // print(details['result'][5]['user_name']);
    var use="balaj";


    for(int i=0;i<=details['result'].length;i++){
      if(use == details['result'][i]['user_name']){
        var c = details['result'][i]['user_name'];
        print(c + 'hello');
        print('correct');
        // break;
      }
      else{
        print('wrong');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: NetworkImage(''), fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(75.0)),
                      boxShadow: [
                        BoxShadow(blurRadius: 7.0, color: Colors.black)
                      ])),
              Container(
                child: Flexible(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          TextFormField(
                              enabled: false,
                              controller: a,
                              // onChanged: (text) {
                              //   users.text =
                              //       "" != null ? '${widget.user}' : "hello";
                              // },

                              decoration: InputDecoration(
                                icon:Icon(Icons.verified_user,color:Colors.black),
                                  hintText:"username",
                                  hintStyle: TextStyle(color: Colors.black))),
                          SizedBox(height: 20.0),
                          TextFormField(
                              controller: b,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person, color: Colors.black),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.black))),
                          SizedBox(height: 20.0),
                          TextFormField(
                              controller: c,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person, color: Colors.black),
                                  hintText: "First_name",
                                  hintStyle: TextStyle(color: Colors.black))),
                          SizedBox(height: 20.0),
                          TextFormField(
                              controller: d,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person, color: Colors.black),
                                  hintText: "Last_name",
                                  hintStyle: TextStyle(color: Colors.black))),
                          SizedBox(height: 20.0),
                          TextFormField(
                              controller: e,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.date_range_rounded,
                                      color: Colors.black),
                                  hintText: "Date of Birth",
                                  hintStyle: TextStyle(color: Colors.black))),
                          SizedBox(height: 20.0),
                          // SelectFormField(
                          //   icon: Icon(Icons.people, color: Colors.black),
                          //   labelText: 'Gender',
                          //   changeIcon: true,
                          //   dialogTitle: 'Pick a item',
                          //   dialogCancelBtn: 'CANCEL',
                          //   enableSearch: true,
                          //   dialogSearchHint: 'Search item',
                          //   items: _items,
                          // ),
                          // SizedBox(height: 20.0),
                          TextFormField(
                              controller: f,
                              decoration: InputDecoration(
                                  icon:
                                  Icon(Icons.star_border, color: Colors.black),
                                  hintText: "Religion",
                                  hintStyle: TextStyle(color: Colors.black))),
                          SizedBox(height: 20.0),
                          TextFormField(
                              controller: g,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person, color: Colors.black),
                                  hintText: "Surname",
                                  hintStyle: TextStyle(color: Colors.black))),
                          SizedBox(height: 20.0),
                          TextFormField(
                              controller: h,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person, color: Colors.black),
                                  hintText: "Surname",
                                  hintStyle: TextStyle(color: Colors.black))),
                          SizedBox(height: 20.0),
                          // SelectFormField(
                          //   icon: Icon(Icons.people, color: Colors.black),
                          //   labelText: 'Bloodgroup',
                          //   changeIcon: true,
                          //   dialogTitle: 'Pick a item',
                          //   dialogCancelBtn: 'CANCEL',
                          //   enableSearch: true,
                          //   dialogSearchHint: 'Search item',
                          //   items: _items,
                          // ),
                          // SelectFormField(
                          //   icon: Icon(Icons.settings, color: Colors.black),
                          //   labelText: 'Bloodgroup',
                          //   changeIcon: true,
                          //   dialogTitle: 'Pick a item',
                          //   dialogCancelBtn: 'CANCEL',
                          //   enableSearch: true,
                          //   dialogSearchHint: 'Search item',
                          //   items: _items,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  },

                  child: Text("Save"))
            ],
          )),
    );
  }
}