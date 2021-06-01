import 'package:flutter/material.dart';

class LargeText extends StatefulWidget {
  final String message;

  LargeText(this.message);


  @override
  _LargeTextState createState() => _LargeTextState();
}

class _LargeTextState extends State<LargeText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.message),
    );
  }
}
