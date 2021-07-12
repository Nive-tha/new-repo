import 'package:flutter/material.dart';

class SuccessfullyRequested extends StatefulWidget {
  @override
  _SuccessfullyRequestedState createState() => _SuccessfullyRequestedState();
}

class _SuccessfullyRequestedState extends State<SuccessfullyRequested> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.40,
      width: width,
      child: Column(
        children: [
          Image.asset('images/bloodSuccessfullyRequested'),
          SizedBox(
            height: (height) * 0.05,
          ),
          Text(
            'Blood is Successfully Requested',
            style: TextStyle(
              color: Colors.indigo.shade900,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
