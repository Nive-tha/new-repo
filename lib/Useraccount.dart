import 'package:flutter/material.dart';

class Check1 extends StatefulWidget {
  @override
  _Check1State createState() => _Check1State();
}

class _Check1State extends State<Check1> {
List numbers =[
  '2',
  '1',
  '3',
  '1',
  '0',
  '0'
];
  List names = [
    'Family names',
    'Location',
    'Relationships',
    'Occupation',
    'Events',
    'Matrimony'
  ];
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeOrientation = MediaQuery.of(context).orientation;
    print(sizeOrientation);
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      body: Container(
        child: Column(
          children: [
            Container(
              height: sizeHeight * 0.11,
              width: sizeWidth,
              padding: EdgeInsets.only(top: 5, left: 15, right: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Row(
                      //   children: [
                      //     Container(
                      //       height: 50,
                      //       width: 80,
                      //
                      //     ),
                      //     SizedBox(
                      //       width: 20,
                      //     ),
                      //     // Container(
                      //     //   height: 80,
                      //     //   width: 80,
                      //     //
                      //     // ),
                      //   ],
                      // ),

                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:0),
              child: Container(
                height: sizeHeight * 0.07,
                padding: EdgeInsets.only(left: 5, right: 5),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: "Account",
                    fillColor: Colors.white,
                    filled: true,
                    // prefixIcon: Icon(
                    //   Icons.door_back,
                    //   size: 35,
                    // ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                // padding: EdgeInsets.all(15.0),
                height: sizeHeight * 0.74,
                width: sizeWidth,
                child: GridView.builder(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 145),
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 34,
                        mainAxisSpacing: 30,
                        childAspectRatio: 1.13),
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.teal,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:20),
                              child: Text(numbers[index],
                                  style: TextStyle(color: Colors.white,
                                      fontSize: 10)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:10.0),
                              child: Text(
                                names[index],
                                style: TextStyle(color: Colors.white,
                                  fontSize: 10,
                                ),

                              ),

                            ),

                          ],
                        ),
                      );

                    }

                    ),

              ),

            ),


  Padding(
    padding: const EdgeInsets.only(left:30),
    child: ElevatedButton(onPressed: (){}, child:Text("")),
  ),
  ElevatedButton(onPressed: (){}, child:Text("")),
  ElevatedButton(onPressed: (){}, child:Text("")),
  ElevatedButton(onPressed: (){}, child:Text("")),

          ],
        ),
      ),
    );
  }
}