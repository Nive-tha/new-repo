import 'package:flutter/material.dart';
import 'package:googleandfacebook/FamilyTourPlan/TakeTourPlan.dart';
import 'package:hexcolor/hexcolor.dart';

import 'customfield/TourPlanProfileCustomField.dart';

class TourPlanProfile extends StatefulWidget {
  TourPlanProfile({Key key}) : super(key: key);

  @override
  _TourPlanProfileState createState() => _TourPlanProfileState();
}

class _TourPlanProfileState extends State<TourPlanProfile> {
  var text, text1;
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
            "Tour Plan",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.edit),
                    ],
                  ),
                ),
                Container(
                    height: height * 0.1,
                    color: Colors.red[300],
                    child: Image.asset(
                      "assets/Try/shivangi.jpg",
                    )),
                SizedBox(height: 30),
                customTextProfile(
                    text = "Organized  By", text1 = "Sunena", width),
                SizedBox(height: 30),
                customTextProfile(
                    text = "Trip Start Date", text1 = "30-07-2021", width),
                SizedBox(height: 30),
                customTextProfile(
                    text = "Trip End Date", text1 = "05-08-2021", width),
                SizedBox(height: 30),
                customTextProfile(
                    text = "From Place", text1 = "Madurai", width),
                SizedBox(height: 30),
                customTextProfile(
                    text = "To Place", text1 = "Kodaikanal", width),
                SizedBox(height: 30),
                customTextProfile(
                    text = "Departure Timing", text1 = "05.00 PM", width),
                SizedBox(height: 30),
                customTextProfile(text = "Travel By", text1 = "Car", width),
                SizedBox(height: 30),
                customTextProfile(
                    text = "Contact No", text1 = "843564746", width),
                SizedBox(height: 30),
                customTextProfile(text = "Request Accepted", text1 = "", width),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Text(
                    "Hi Dear Family Members,come sharpely before 4.30 pm and make sure to come...",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      // color: Colors.green,
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.share,
                          size: 30.0,
                          color: HexColor("#0A4E51"),
                        ),
                        label: Text(
                          '   Share    ',
                          style: TextStyle(color: HexColor("#0A4E51")),
                        ),
                        onPressed: () {
                          print('Pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side:
                              BorderSide(width: 1, color: HexColor("#0A4E51")),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      // color: Colors.green,
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.delete,
                          size: 30.0,
                          color: HexColor("#0A4E51"),
                        ),
                        label: Text(
                          '   Delete   ',
                          style: TextStyle(color: HexColor("#0A4E51")),
                        ),
                        onPressed: () {
                          print('Pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side:
                              BorderSide(width: 1, color: HexColor("#0A4E51")),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
