import 'package:flutter/material.dart';

import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/MANAGE%20PHOTOS%20PAGE/manage_photos.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Matrimonysecondpage.dart';
import 'customfield/basic1_details_support_page.dart';

class MatrimonyBasicDetails2 extends StatefulWidget {
  MatrimonyBasicDetails2({Key key}) : super(key: key);

  @override
  _MatrimonyBasicDetails2State createState() => _MatrimonyBasicDetails2State();
}

class _MatrimonyBasicDetails2State extends State<MatrimonyBasicDetails2> {
  var text;
  var controller;
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
                      builder: (BuildContext context) => MatrimonySecond()));
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
              customSelectFormField(height, width, text = "Education"),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField(height, width, text = "Job Category"),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField(height, width, text = "Job Location"),
              SizedBox(height: (height - 20) * 0.02),
              customTextFormField(
                  height, width, text = "Annual Income", controller = name),
              SizedBox(height: (height - 20) * 0.02),
              customTextFormField(
                  height, width, text = "Father's Name", controller = name),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField(height, width, text = "Father's Job"),
              SizedBox(height: (height - 20) * 0.02),
              customTextFormField(
                  height, width, text = "Mother's Name", controller = name),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField(height, width, text = "Mother's Job"),
              SizedBox(height: (height - 20) * 0.02),
              Row(children: [
                Container(
                  height: (height - 20) * 0.1,
                  width: (width - 30) * 0.4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Current Address",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: (height - 20) * 0.1,
                  width: (width - 30) * 0.6,
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        borderSide:
                            BorderSide(color: HexColor("#0A4E51"), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        borderSide:
                            BorderSide(color: HexColor("#0A4E51"), width: 1),
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(height: (height - 20) * 0.02),
              Container(
                height: 100,
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    labelText: "Notes",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      borderSide:
                          BorderSide(color: HexColor("#0A4E51"), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      borderSide:
                          BorderSide(color: HexColor("#0A4E51"), width: 1),
                    ),
                  ),
                ),
              ),
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
                                  builder: (context) => ManagePhotos()));
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
