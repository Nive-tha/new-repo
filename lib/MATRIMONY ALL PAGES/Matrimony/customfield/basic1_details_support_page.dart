import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:select_form_field/select_form_field.dart';

final List<Map<String, dynamic>> _items = [
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
Widget customSelectFormField(double height, double width, text) {
  return Row(
    children: [
      Container(
        height: (height - 20) * 0.05,
        width: (width - 30) * 0.4,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Container(
        height: (height - 20) * 0.05,
        width: (width - 30) * 0.6,
        child: SelectFormField(
          items: _items,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(color: HexColor("#0A4E51"), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(color: HexColor("#0A4E51"), width: 1),
            ),
          ),
        ),
      ),
    ],
  );
}

Row customTextFormField(double height, double width, text, controller) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Container(
      height: (height - 20) * 0.05,
      width: (width - 30) * 0.4,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
    Container(
      height: (height - 20) * 0.05,
      width: (width - 30) * 0.6,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(color: HexColor("#0A4E51"), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(color: HexColor("#0A4E51"), width: 1),
          ),
        ),
      ),
    ),
  ]);
}
