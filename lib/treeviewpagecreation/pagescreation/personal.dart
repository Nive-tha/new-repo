import 'package:flutter/material.dart';

class Personal extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  var personalDetailsUserName = TextEditingController();
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var controller3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 75,
              width: 75,
              child: Image.asset('assets/image.png'),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
              ),
            ),
          ),
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
          Container(
            height: 50,
            width: 140,
            child: Center(
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(30), right: Radius.circular(30)),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({this.hintText1, this.icon});

  final hintText1;
  final icon;

  @override
  _CustomsTextFormFieldState createState() => _CustomsTextFormFieldState();
}

class _CustomsTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    var hintText1 = widget.hintText1;
    var icon = widget.icon;

    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 8, bottom: 8),
      child: GestureDetector(
        onTap: () {},
        child: TextFormField(
          controller: null,
          decoration: InputDecoration(
            hintText: hintText1,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            filled: true,
            fillColor: Colors.teal.shade50,
            prefixIcon: icon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal.shade50),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal.shade50),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
