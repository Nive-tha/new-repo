import 'package:flutter/material.dart';
import 'package:google/treeviewpagecreation/pagescreation/personal.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  var radio1 = 'Use my Current Location';
  var groupValue1 = 'Use my Current Location';
  var value0 = Colors.amber;
  var value1 = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                CustomTextFormField(
                  hintText1: null,
                  icon: Icon(Icons.phone),
                ),
                CustomTextFormField(
                  hintText1: 'Email',
                  icon: Icon(Icons.email),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: value0,
                              groupValue: 'Use my Current Location',
                              onChanged: (val) {}),
                          SizedBox(width: 8),
                          Text(
                            'Use my Current Location',
                            style: TextStyle(color: Colors.teal),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              activeColor: Colors.teal,
                              value: value1,
                              autofocus: false,
                              groupValue: groupValue1,
                              onChanged: (val) {
                                setState(() {
                                  value1 = Colors.teal;
                                });
                              }),
                          SizedBox(width: 8),
                          Text(
                            'Current Address',
                            style: TextStyle(color: Colors.teal),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
