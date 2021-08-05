import 'package:flutter/material.dart';
import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/matrimony_search_your_partner.dart';
import 'package:googleandfacebook/TEST%20PAGE/test_page.dart';

class BestMatches extends StatefulWidget {
  @override
  _BestMatchesState createState() => _BestMatchesState();
}

class _BestMatchesState extends State<BestMatches> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var status = MediaQuery.of(context).padding.top;
    var appBar = AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Text(
          'Best Matches',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [
          TextButton(
            onPressed: null,
            child: Text(
              'Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: (height - appBar),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: (height - appBar) * 0.1,
              width: width,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Partner Profile',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_3),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MatrimonySearchYourPartner()));
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: (height - appBar) * 0.01,
            ),
            Container(
              height: (height - appBar) * 0.2,
              width: width,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TestPage()));
                      },
                      child: Container(
                        height: (height - appBar) * 0.15,
                        width: width * 0.4,
                        child: Image.asset(
                            'assets/Login Page Folder/Images/facebook.jpeg'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: (height - appBar) * 0.15,
                        width: width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Aswin T U',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.teal.shade900,
                              ),
                            ),
                            Text(
                              'Aswin T U',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.teal.shade900,
                              ),
                            ),
                            Text(
                              'Aswin T U',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.teal.shade900,
                              ),
                            ),
                            Text(
                              'Aswin T U',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.teal.shade900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
