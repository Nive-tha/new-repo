import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home1 extends StatefulWidget {
  Home1({Key? key}) : super(key: key);

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  List images = [
    'assets/matrimony.png',
    'assets/job.png',
    'assets/tour-bus.png',
    'assets/party.png',
    'assets/image-gallery.png',
    'assets/calender.png',
    'assets/blood-donation.png',
    'assets/call.png',
    'assets/healthcare.png',
    'assets/cooking.png'
  ];

  List headings = [
    'Matrimony',
    'Job Portal',
    'Family Tour Plan',
    'Events',
    'Image Gallery',
    'Calender',
    'Blood Donate',
    'Calls',
    'Health Tips',
    'Cooking Tips'
  ];
  List movingpages = [];
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        
        child: Column(
          children: [
            Container(
              height: sizeHeight * 0.29,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: ExactAssetImage('assets/hometree.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 50.0,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.notifications,
                          size: 50.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                  Container(
                    height: 45,
                    width: 280,
                    child: TextFormField(
                      decoration: InputDecoration(
                     
                        enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(width: 2, color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(width: 2, color: Colors.white),
                        ),
                        hintText: "Search ",
                        hintStyle: TextStyle(color: Colors.white),
       
                     
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: new BoxDecoration(
                // color: Colors.red,
                image: new DecorationImage(
                  image: ExactAssetImage('assets/back.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: sizeHeight * 0.71,
              child: Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 7),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 11,
                        mainAxisSpacing: 6,
                        childAspectRatio: 1.0),
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5)),
                                    border: Border.all(color: Colors.white)),
                                child: Center(
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    movingpages[index]));
                                      },
                                      child: Image.asset(
                                        images[index],
                                        height: 50,
                                        width: 50,
                                      )),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.cyan[900],
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                  border: Border.all(color: Colors.white)),
                              height: 60,
                              child: Center(
                                child: Text(
                                  headings[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // elevation: 5,
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }


}
