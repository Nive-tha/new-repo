import 'package:flutter/material.dart';
import 'package:googleandfacebook/FamilyTourPlan/TakeTourPlan.dart';
import 'package:googleandfacebook/FamilyTourPlan/TourPlanProfile.dart';
import 'package:hexcolor/hexcolor.dart';
import 'customfield/TourPlan1customfield.dart';

class TakeTourPlan1 extends StatefulWidget {
  TakeTourPlan1({Key key}) : super(key: key);

  @override
  _TakeTourPlan1State createState() => _TakeTourPlan1State();
}

class _TakeTourPlan1State extends State<TakeTourPlan1> {
  final dateController = TextEditingController();
  final dateController1 = TextEditingController();
  var text;
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
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Take a Tour Plan",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  customRowTextfieldTourPlan(
                      height, width, text = "Organized By"),
                  SizedBox(height: (height - 20) * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: (height - 20) * 0.05,
                        width: (width - 30) * 0.4,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Trip Start Date",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: (height - 20) * 0.05,
                        width: (width - 30) * 0.6,
                        child: TextFormField(
                          controller: dateController,
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            dateController.text =
                                date.toString().substring(0, 10);
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              borderSide: BorderSide(
                                  color: HexColor("#0A4E51"), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              borderSide: BorderSide(
                                  color: HexColor("#0A4E51"), width: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: (height - 20) * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: (height - 20) * 0.05,
                        width: (width - 30) * 0.4,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Trip End Date",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: (height - 20) * 0.05,
                        width: (width - 30) * 0.6,
                        child: TextFormField(
                          controller: dateController1,
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            dateController.text =
                                date.toString().substring(0, 10);
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              borderSide: BorderSide(
                                  color: HexColor("#0A4E51"), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              borderSide: BorderSide(
                                  color: HexColor("#0A4E51"), width: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: (height - 20) * 0.02),
                  customRowTextfieldTourPlan(
                      height, width, text = "From Place"),
                  SizedBox(height: (height - 20) * 0.02),
                  customRowTextfieldTourPlan(height, width, text = "To Place"),
                  SizedBox(height: (height - 20) * 0.02),
                  customRowTextfieldTourPlan(
                      height, width, text = "Departure Timing"),
                  SizedBox(height: (height - 20) * 0.02),
                  customRowTextfieldTourPlan(height, width, text = "Travel By"),
                  SizedBox(height: (height - 20) * 0.02),
                  customRowTextfieldTourPlan(
                      height, width, text = "Contact No"),
                  SizedBox(height: (height - 20) * 0.04),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Description : ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  SizedBox(height: (height - 20) * 0.02),
                  Container(
                    height: (height - 20) * 0.1,
                    width: (width - 30) * 0.90,
                    child: TextField(
                      maxLines: 4,
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
                  SizedBox(height: (height - 20) * 0.06),
                  Container(
                    height: 60,
                    width: width,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            side: BorderSide(
                                color: HexColor('#0A4E51'), width: 2)),
                        color: HexColor('#0A4E51'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TourPlanProfile()));
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
