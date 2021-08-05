import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:select_form_field/select_form_field.dart';
import 'Matrimonyfirstpage.dart';
import 'customfield/basic_details_support_page.dart';
import 'Matrimony_basic_details_2.dart';

class MatrimonySecond extends StatefulWidget {
  MatrimonySecond({Key key}) : super(key: key);

  @override
  _MatrimonySecondState createState() => _MatrimonySecondState();
}

class _MatrimonySecondState extends State<MatrimonySecond> {
  var text;
  var controller;
  final TextEditingController name = TextEditingController();
  final TextEditingController dob = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var onPressed;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[HexColor('#0A4E51'), HexColor('#149BA1')])),
        ),
        backgroundColor: Colors.teal,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          FlatButton(
            padding: EdgeInsets.zero,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Back',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ),
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MatrimonyFirstPage()));
            },
          )
        ],
        title: Text(
          'Basic Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customRowTextFormField(
                  height, width, text = "Name", controller = name),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField(height, width, text = "Body Type"),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField(height, width, text = "Physical Status"),
              SizedBox(height: (height - 20) * 0.02),
              customRowTextFormField(
                  height, width, text = "DOB", controller = dob),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField(height, width, text = "Complexion"),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField(height, width, text = "Height"),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField(height, width, text = "Marital Status"),
              SizedBox(height: (height - 20) * 0.02),
              customRowTextFormField(
                  height, width, text = "Number of children", controller = dob),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField(height, width, text = "Gender"),
              SizedBox(height: (height - 20) * 0.02),
              customRowTextFormField(
                  height, width, text = "Mobile Number", controller = dob),
              SizedBox(height: (height - 20) * 0.02),
              customRowTextFormField(
                  height, width, text = "Whatsapp Number", controller = dob),
              SizedBox(height: (height - 20) * 0.02),
              customRowTextFormField(
                  height, width, text = "Email", controller = dob),
              SizedBox(height: (height - 20) * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    width: width * 0.35,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            side: BorderSide(
                                color: HexColor('#0A4E51'), width: 2)),
                        color: Colors.white,
                        onPressed: () {},
                        child: Text("cancel")),
                  ),
                  Container(
                    height: 40,
                    width: width * 0.35,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            side: BorderSide(
                                color: HexColor('#0A4E51'), width: 2)),
                        // onHighlightChanged: (value) => onPressed,
                        highlightColor: HexColor('#0A4E51'),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MatrimonyBasicDetails2()));
                        },
                        child: Text(
                          "save",
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
