import 'package:flutter/material.dart';
import 'package:google/treeviewpagecreation/pagescreation/fatherdetails.dart';
import 'package:google/treeviewpagecreation/pagescreation/personal.dart';

class Professional extends StatefulWidget {
  @override
  _ProfessionalState createState() => _ProfessionalState();
}

class _ProfessionalState extends State<Professional> {
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
                    hintText1: "Username",
                    icon: Icon(Icons.person),
                  ),
                  CustomTextFormField(
                    hintText1: "Date of birth",
                    icon: Icon(Icons.calendar_today),
                  ),
                  CustomTextFormField(
                    hintText1: "Gender",
                    icon: Icon(Icons.search),
                  ),
                  CustomTextFormField(
                    hintText1: "Religion",
                    icon: Icon(Icons.party_mode),
                  ),
                  CustomTextFormField(
                    hintText1: "Self",
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
        ],
      ),
    );
  }
}
