import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'TakeTourPlan1.dart';

class TakeTourPlan extends StatefulWidget {
  TakeTourPlan({Key key}) : super(key: key);

  @override
  _TakeTourPlanState createState() => _TakeTourPlanState();
}

class _TakeTourPlanState extends State<TakeTourPlan> {
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
        padding: EdgeInsets.only(top: 20),
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              width: width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.teal,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "27-06-2021",
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/FamilyTourPlan/tourplace.png",
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              "Kodaikanal",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TakeTourPlan1()));
                  },
                  child: Image.asset("assets/FamilyTourPlan/add.png")),
            ),
          ],
        ),
      ),
    );
  }
}
