import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:google/familytourplan/familytourplan.dart';
<<<<<<< HEAD
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
=======
import 'package:intl/intl.dart';

>>>>>>> 4aeb89c139d378ef31d4266065172d45a1ce9ae7
import 'job.dart';

class JobPostingRequest extends StatefulWidget {
  const JobPostingRequest({Key? key}) : super(key: key);

  @override
  _JobPostingRequestState createState() => _JobPostingRequestState();
}

@override
void initState() {
  // ignore: todo
  // TODO: implement initState
  initState();
  saved();
}

saved() async {
  SharedPreferences get = await SharedPreferences.getInstance();
  receiveId = get.getStringList('idS');
  familyId = receiveId[0];
  user_Id = receiveId[1];
  print(user_Id);
  print(familyId);
  famid.text = familyId;
  id.text = user_Id;
}

Future _posT(a, b, c, d, e, f, g, k) async {
// print('func');

  //

  final String url =
      "http://8d4bba7d1b46.ngrok.io/parampara/userpersonal/jobportal";
  SharedPreferences get = await SharedPreferences.getInstance();
  receiveId = get.getStringList('idS');
  familyId = receiveId[0];
  user_Id = receiveId[1];
  print(user_Id);
  print(familyId);
  famid.text = familyId;
  id.text = user_Id;
  final response = await http.post(Uri.parse(url), body: {
    'id': a,
    'family_id': b,
    'requester_name': c,
    'posting_date': d,
    'company_name': e,
    'position_title': f,
    'position_end_date': g,
    'number_of_position': k,
  });
  print(response);
  print(response.body);
  var receivedDetails = json.decode(response.body);
  print(receivedDetails);
  var details = receivedDetails[0][''];
}

var requester_name = TextEditingController();
var posting_date = TextEditingController();
var company_name = TextEditingController();
var position_title = TextEditingController();
var position_end_date = TextEditingController();
var number_of_position = TextEditingController();
var famid = TextEditingController();
var id = TextEditingController();

class _JobPostingRequestState extends State<JobPostingRequest> {
  var postingDate = TextEditingController();
  var postingEndDate = TextEditingController();
  Future datePickingStart() async {
    var today = DateTime.now();
    print(today);
    var date = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (date == null)
      return;
    else {
      setState(() {
        postingDate.text = DateFormat('yyyy/MM/dd').format(date);
      });
    }
  }

  Future datePickingEnd() async {
    var today = DateTime.now();
    print(today);
    var date = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (date == null)
      return;
    else {
      setState(() {
        postingEndDate.text = DateFormat('yyyy/MM/dd').format(date);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    var bottom = kBottomNavigationBarHeight;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        child: Column(
          children: [
            Container(
              height: ((sizeHeight - bottom) * 0.15),
              width: sizeWidth,
              color: Colors.teal,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: ((sizeHeight - bottom) * 0.15) * 0.5,
                    width: sizeWidth,
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
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.teal,
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
<<<<<<< HEAD
                                          new LandingPage()));
=======
                                          new Job()));
>>>>>>> 4aeb89c139d378ef31d4266065172d45a1ce9ae7
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Job Posting Request',
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
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("assets/matrimony.jpeg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                height: sizeHeight * 0.74,
                width: sizeWidth,
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 280,
                          height: 50,
                          child: TextFormField(
<<<<<<< HEAD
                              controller: requester_name,
=======
>>>>>>> 4aeb89c139d378ef31d4266065172d45a1ce9ae7
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  filled: true,
                                  fillColor: Colors.white,
                                  // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade50, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                    borderSide: BorderSide(color: Colors.teal),
                                  ),
                                  hintText: "   Requester name",
                                  hintStyle: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 15,
                                    // fontWeight: FontWeight.bold,
                                  ))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 280,
                          height: 50,
                          child: TextFormField(
<<<<<<< HEAD
                              controller: posting_date,
=======
                              controller: postingDate,
>>>>>>> 4aeb89c139d378ef31d4266065172d45a1ce9ae7
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.date_range),
                                  filled: true,
                                  fillColor: Colors.white,
                                  // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade50, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                    borderSide: BorderSide(color: Colors.teal),
                                  ),
                                  hintText: "   Posting Date",
                                  hintStyle: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 15,
                                    // fontWeight: FontWeight.bold,
                                  ))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 280,
                          height: 50,
                          child: TextFormField(
                              controller: company_name,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.supervised_user_circle),
                                  filled: true,
                                  fillColor: Colors.white,
                                  // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade50, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                    borderSide: BorderSide(color: Colors.teal),
                                  ),
                                  hintText: "   Company name",
                                  hintStyle: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 15,
                                    // fontWeight: FontWeight.bold,
                                  ))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 280,
                          height: 50,
                          child: TextFormField(
                              controller: position_title,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.title),
                                  filled: true,
                                  fillColor: Colors.white,
                                  // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade50, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                    borderSide: BorderSide(color: Colors.teal),
                                  ),
                                  hintText: "   Position title",
                                  hintStyle: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 15,
                                    // fontWeight: FontWeight.bold,
                                  ))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 280,
                          height: 50,
                          child: TextFormField(
                              controller: position_end_date,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.format_list_numbered),
                                  filled: true,
                                  fillColor: Colors.white,
                                  // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade50, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                    borderSide: BorderSide(color: Colors.teal),
                                  ),
                                  hintText: "   Number of Position",
                                  hintStyle: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 15,
                                    // fontWeight: FontWeight.bold,
                                  ))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 280,
                          height: 50,
                          child: TextFormField(
<<<<<<< HEAD
                              controller: number_of_position,
=======
                              controller: postingEndDate,
>>>>>>> 4aeb89c139d378ef31d4266065172d45a1ce9ae7
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.date_range),
                                  filled: true,
                                  fillColor: Colors.white,
                                  // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade50, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                    borderSide: BorderSide(color: Colors.teal),
                                  ),
                                  hintText: "   Position End Date",
                                  hintStyle: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 15,
                                    // fontWeight: FontWeight.bold,
                                  ))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: sizeWidth,
                          height: 100,
                          padding: EdgeInsets.only(left: 28, right: 28),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(15, 15),
                              ),
                            ),
                            child: TextFormField(
                                // maxLines: 3,
                                // maxLength: 10,

                                // controller: username,
                                decoration: InputDecoration(
                                    // prefixIcon: Icon(Icons.person),
                                    // filled: true,
                                    // fillColor: Colors.white,
                                    border: InputBorder.none,
                                    // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    // enabledBorder: OutlineInputBorder(
                                    //   borderRadius:
                                    //       BorderRadius.all(Radius.circular(30.0)),
                                    //   borderSide: BorderSide(
                                    //       color: Colors.teal.shade50, width: 1),
                                    // ),
                                    // focusedBorder: OutlineInputBorder(
                                    //   borderRadius:
                                    //       BorderRadius.all(Radius.circular(40.0)),
                                    //   borderSide: BorderSide(color: Colors.teal),
                                    // ),
                                    hintText: "   Job Description",
                                    hintStyle: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                    ))),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            final String a = id.text;
                            final String b = famid.text;
                            final String c = requester_name.text;
                            final String d = posting_date.text;
                            final String e = company_name.text;
                            final String f = position_title.text;
                            final String g = position_end_date.text;
                            final String k = number_of_position.text;

                            _posT(a, b, c, d, e, f, g, k);
                            saveid();
                          },
                          child: Text(
                            'Post',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
