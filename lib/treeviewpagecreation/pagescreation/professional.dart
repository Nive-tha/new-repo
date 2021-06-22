import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google/treeviewpagecreation/pagescreation/fatherdetails.dart';
import 'package:google/treeviewpagecreation/pagescreation/personal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Professional extends StatefulWidget {
  @override
  _ProfessionalState createState() => _ProfessionalState();
}

class _ProfessionalState extends State<Professional> {
  var qualification = TextEditingController();
  var institute = TextEditingController();
  var workingAsA = TextEditingController();
  var workplaceName = TextEditingController();
  var workplaceLocation = TextEditingController();
  var sharedPreferenceGotUserId;
  var sharedPreferenceUseUserId;
  @override
  void initState() {
    super.initState();
    sharedPreferenceUserId();
  }

  sharedPreferenceUserId() async {
    var sharedUserId = await SharedPreferences.getInstance();
    sharedPreferenceGotUserId = sharedUserId.getStringList('pic');
    sharedPreferenceUseUserId = sharedPreferenceGotUserId[1];
  }

  upload() async {
    var url = Uri.parse("uri");
    var uploading = await http.post(url, body: {
      "id": sharedPreferenceUseUserId,
      "qualification": qualification.text,
      "institute": institute.text,
      "workingAsA": workingAsA.text,
      "workplaceName": workplaceName.text,
      "workplaceLocation": workplaceLocation.text,
    });
    print(uploading.statusCode);
    print(json.decode(uploading.body));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: qualification,
                    hintText1: "Qualification",
                    icon: Icon(Icons.person),
                  ),
                  CustomTextFormField(
                    controller: institute,
                    hintText1: "Institute",
                    icon: Icon(Icons.calendar_today),
                  ),
                  CustomTextFormField(
                    controller: workingAsA,
                    hintText1: "Working As ",
                    icon: Icon(Icons.search),
                  ),
                  CustomTextFormField(
                    controller: workplaceName,
                    hintText1: "Workplace Name",
                    icon: Icon(Icons.party_mode),
                  ),
                  CustomTextFormField(
                    controller: workplaceLocation,
                    hintText1: "workplace Location",
                    icon: Icon(Icons.people),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FatherDetails()));
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: InkWell(
                onTap: () {
                  upload();
                },
                child: Container(
                  height: 50,
                  width: 140,
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30), right: Radius.circular(30)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
