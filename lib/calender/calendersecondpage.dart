import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class CalendarSecondPage extends StatefulWidget {
  // const CalendarSecondPage({Key? gitkey}) : super(key: key);

  @override
  _CalendarSecondPageState createState() => _CalendarSecondPageState();
}

class _CalendarSecondPageState extends State<CalendarSecondPage> {
  var today = DateTime.now();
  var text;
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'yesterday',
      'label': 'yesterday',
    },
    {
      'value': 'today',
      'label': 'today',
    },
    {
      'value': 'tomorrow',
      'label': 'tomorrow',
    },
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var bottom = kBottomNavigationBarHeight;
    var safeArea = MediaQuery.of(context).padding.top;
    var padding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: ((height - bottom) * 0.15),
              width: width,
              color: Colors.teal,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: ((height - bottom) * 0.15) * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Calendar',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.teal),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 10,
                left: 15,
                right: 15,
              ),
              height: (height - bottom) * 0.85,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  customText(
                    text = "Create Remainder",
                  ),
                  SizedBox(
                    height: ((height - bottom) * 0.85) * 0.02,
                  ),
                  customText(
                    text = "Title",
                  ),
                  SizedBox(
                    height: ((height - bottom) * 0.85) * 0.02,
                  ),
                  Container(
                    height: ((height - bottom) * 0.85) * 0.1,
                    width: width - 30,
                    child: Card(
                      color: Colors.grey.shade100,
                    ),
                  ),
                  SizedBox(
                    height: ((height - bottom) * 0.85) * 0.02,
                  ),
                  Row(
                    children: [
                      customText(
                        text = "Date",
                      ),
                      SizedBox(width: width * 0.53),
                      customText(
                        text = "Time",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ((height - bottom) * 0.85) * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: ((height - bottom) * 0.85) * 0.07,
                            width: width * 0.3,
                            child: Card(
                              color: Colors.grey.shade100,
                              child: SelectFormField(
                                decoration: InputDecoration(
                                  hintText: "select",
                                  border: InputBorder.none,
                                  suffixIcon: Icon(Icons.arrow_drop_down),
                                ),
                                items: _items,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: ((height - bottom) * 0.85) * 0.07,
                            width: width * 0.2,
                            child: Card(
                              color: Colors.grey.shade100,
                            ),
                          ),
                          Text(
                            ":",
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            height: ((height - bottom) * 0.85) * 0.07,
                            width: width * 0.2,
                            child: Card(
                              color: Colors.grey.shade100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ((height - bottom) * 0.85) * 0.02,
                  ),
                  customText(
                    text = "Description",
                  ),
                  SizedBox(
                    height: ((height - bottom) * 0.85) * 0.02,
                  ),
                  Container(
                    height: ((height - bottom) * 0.85) * 0.25,
                    width: width,
                    child: Card(
                      color: Colors.grey.shade100,
                    ),
                  ),
                  SizedBox(
                    height: ((height - bottom) * 0.85) * 0.2,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: ((height - bottom) * 0.85) * 0.06,
                      width: width / 3.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(30, 30),
                        ),
                        color: Colors.teal,
                      ),
                      child: Center(
                          child: Text(
                        "Create",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customText(text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.teal,
      ),
    );
  }
}
