import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget customTextFormFieldPlusButton(double height, double appBar, double width,
    controller, onTapStart, onTapEnd) {
  return Container(
    height: (height - appBar) * 0.05,
    width: (width - 40) * 0.47,
    child: TextFormField(
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        fontSize: 18,
      ),
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: InkWell(
          onTap: onTapStart,
          child: Container(
            height: (height - appBar) * 0.05,
            width: (width - 40) * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              border: Border.all(
                style: BorderStyle.solid,
                color: HexColor('#0A4E51'),
              ),
              shape: BoxShape.rectangle,
              // color: Colors.green,
            ),
            child: Icon(Icons.remove),
          ),
        ),
        suffixIcon: InkWell(
          onTap: onTapEnd,
          child: Container(
            height: (height - appBar) * 0.06,
            width: (width - 40) * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              border: Border.all(
                style: BorderStyle.solid,
                color: HexColor('#0A4E51'),
              ),
              shape: BoxShape.rectangle,
              // color: Colors.green,
            ),
            child: Icon(Icons.add),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: HexColor('#0A4E51'),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: HexColor('#0A4E51'),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    ),
  );
}
