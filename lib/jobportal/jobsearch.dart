import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class JobSearch extends StatefulWidget {
  @override
  _JobSearchState createState() => _JobSearchState();
}

class _JobSearchState extends State<JobSearch> {
  var fam_id = TextEditingController();
  var search = TextEditingController();
  var receiveId;

  Future _read(a, b) async {
// print('func');

    //
    SharedPreferences prefer = await SharedPreferences.getInstance();
    receiveId = prefer.getStringList('idS');
    fam_id.text = receiveId[1];

    print(receiveId[0]);
    print(receiveId[1]);
    final String url =
        "http://192.168.1.23:3300/parampara/userpersonal/jobportal/searchdata";
    final response =
        await http.post(Uri.parse(url), body: {'family_id': a, 'search': b});
    print(response);
    print(response.body);
  }

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Male',
      'label': 'Male',
      // 'icon': Icon(Icons.stop),
    },
    {
      'value': 'Female',
      'label': 'Female',
      // 'icon': Icon(Icons.fiber_manual_record),
      // 'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': 'others',
      'label': 'others',
      // 'enable': false,
      // 'icon': Icon(Icons.grade),
    },
  ];
  var text;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var bottom = kBottomNavigationBarHeight;
    var topPad = kMaterialListPadding.top;
    var bottomPad = kMaterialListPadding.bottom;
    print(topPad);
    print(bottomPad);
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
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Container(
                    height: ((height - bottom) * 0.15) * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                            ),
                            iconSize: 20,
                            color: Colors.teal,
                            splashColor: Colors.tealAccent,
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new LandingPage()));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Job Search',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.teal),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: ((height - bottom) * 0.85),
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('assets/Joppost.jpeg'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Container(
                    height: ((height - bottom) * 0.85) * 0.15,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.teal,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            'Find your Dream Job!',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.teal,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: ((height - bottom) * 0.85) * 0.15,
                    width: width,
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.6,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(30, 30),
                              ),
                            ),
                            child: TextFormField(
                              controller: search,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: InkWell(
                                  child: Icon(
                                    Icons.search,
                                    size: 35,
                                    color: Colors.teal,
                                  ),
                                  onTap: () async {
                                    SharedPreferences prefer =
                                        await SharedPreferences.getInstance();
                                    receiveId = prefer.getStringList('idS');
                                    fam_id.text = receiveId[1];
                                    print(fam_id);
                                    final String a = fam_id.text;
                                    final String b = search.text;
                                    _read(a, b);
                                  },
                                ),
                                hintText: "Search your best jobs",
                                hintStyle:
                                    TextStyle(color: Colors.teal, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.4,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(30, 30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: SelectFormField(
                                items: _items,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 30,
                                    color: Colors.teal,
                                  ),
                                  hintText: "Place",
                                  hintStyle: TextStyle(
                                      color: Colors.teal, fontSize: 14),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 8),
                      height: ((height - bottom) * 0.85) * 0.55,
                      width: width,
                      color: Colors.white,
                      child: Column(
                        children: [
                          cardRowContainer(height, width, bottom,
                              text = "Senior Engineer", topPad, bottomPad),
                          cardRowContainer(height, width, bottom,
                              text = "Senior Engineer", topPad, bottomPad),
                        ],
                      )),
                  Container(
                    height: ((height - bottom) * 0.85) * 0.15,
                    width: width,
                    color: Colors.white,
                    child: Center(
                      child: Container(
                        height: (((height - bottom) * 0.85) * 0.15) * 0.6,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Upload your Updated Resume',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.teal,
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.people),
      //       label: "people",
      //     ),
      //   ],
      // ),
    );
  }

  Widget cardRowContainer(
      double height, double width, double bottom, text, topPad, bottomPad) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Container(
            height: ((((height - bottom) * 0.85) * 0.55) * 0.4) -
                (topPad + bottomPad),
            width: (width * 0.5) - 20,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Container(
            height: ((((height - bottom) * 0.85) * 0.55) * 0.4) -
                (topPad + bottomPad),
            width: (width * 0.5) - 20,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
