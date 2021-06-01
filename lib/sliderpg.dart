import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google/LoginPage/Mail.dart';

class CustomIndicator extends StatefulWidget {
  @override
  _CustomIndicatorState createState() => _CustomIndicatorState();
}

class _CustomIndicatorState extends State<CustomIndicator> {
  int currentPos = 0;
  List<String> listPaths = [
    'assets/tuts2.png',
    'assets/family.png',
    'assets/getstarted.png'
  ];

  List<String> titles = [
    ' Keep your family members \n        together always',
    '    Parambara helps to \nRemember your Ancestry',
    "  \n Follow your family's heritage"
  ];

  @override
  Widget build(BuildContext context) {
    List button = [
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Mail()));
          },
          child: Text('Skip'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)))),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Mail()));
          },
          child: Text('Skip'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)))),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Mail()));
          },
          child: Text('GetStarted'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)))),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 190),
        child: Column(children: [
          CarouselSlider.builder(
            itemCount: listPaths.length,
            options: CarouselOptions(
                autoPlay: false,
                height: 200.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPos = index;
                  });
                }),
            itemBuilder: (context, index, realIndex) {
              return MyImageView(listPaths[index]);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              '${titles[currentPos]}',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.teal),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listPaths.map((url) {
              int index = listPaths.indexOf(url);

              return Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  child: Container(
                    width: 8.0,
                    height: 10.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      shape: BoxShape.circle,
                      color: currentPos == index ? Colors.teal : Colors.white,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(
            child: Container(
              child: Column(
                children: [
                  button[currentPos],
                ],
              ),
            ),
          ),
        ]),
      )),
    );
  }
}

class MyImageView extends StatelessWidget {
  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(imgPath),
        ));
  }
}
