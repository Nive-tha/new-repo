import 'package:flutter/material.dart';
import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/matrimony_search_your_partner.dart';
import 'package:hexcolor/hexcolor.dart';

class ManagePhotos extends StatefulWidget {
  @override
  _ManagePhotosState createState() => _ManagePhotosState();
}

class _ManagePhotosState extends State<ManagePhotos> {
  bool isClicked = false, isClickedSecond = false;
  var top = 30.0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var status = MediaQuery.of(context).padding.top;
    var appBar = AppBar().preferredSize.height;
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
        title: Text(
          'Search your Partner',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: (height - appBar) - top,
        width: width,
        padding: EdgeInsets.only(
          top: top,
          left: 30.0,
          right: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Photos(0)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ((height - appBar) - top) * 0.05,
            ),
            Container(
              height: ((height - appBar) - top) * 0.2,
              width: width * 0.45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2.0),
              ),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.add,
                        color: Colors.teal.shade900,
                        size: 90,
                      ),
                    ),
                    Text(
                      'Upload Photos',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ((height - appBar) - top) * 0.05,
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Horoscope Photos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ((height - appBar) - top) * 0.05,
            ),
            Container(
              height: ((height - appBar) - top) * 0.2,
              width: width * 0.45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2.0),
              ),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.teal.shade900,
                      size: 90,
                    ),
                    Text(
                      'Upload Photos',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ((height - appBar) - top) * 0.20,
            ),
            Expanded(
              child: Container(
                height: (height - appBar) * 0.05,
                width: width,
                child: doubleRowButton(height, appBar, width),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget doubleRowButton(height, appBar, width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isClicked == false ? Colors.white : Colors.teal,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.teal.shade700,
                width: 2,
              ),
            ),
            height: (height - appBar) * 0.05,
            width: (width - 40) * 0.45,
            child: Center(
                child: Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isClicked == false ? Colors.black : Colors.white,
              ),
            )),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isClickedSecond = !isClickedSecond;
            });
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MatrimonySearchYourPartner()));
          },
          child: Container(
            decoration: BoxDecoration(
                color: isClickedSecond == false ? Colors.white : Colors.teal,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.teal.shade700,
                  width: 2,
                )),
            height: (height - appBar) * 0.05,
            width: (width - 40) * 0.45,
            child: Center(
                child: Text(
              'Submit',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isClickedSecond == false ? Colors.black : Colors.white,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
