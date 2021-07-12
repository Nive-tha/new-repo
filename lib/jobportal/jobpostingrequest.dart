import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class JobPostingRequest extends StatefulWidget {
  @override
  _JobPostingRequestState createState() => _JobPostingRequestState();
}

class _JobPostingRequestState extends State<JobPostingRequest> {
  var name = TextEditingController();
  var companyname = TextEditingController();
  var noofposition = TextEditingController();
  var desc = TextEditingController();
  var positiontitle = TextEditingController();
  var postingDate = TextEditingController();
  var postingEndDate = TextEditingController();

  var fam_id = TextEditingController();
  var id = TextEditingController();
  var receiveId;

  Future _read(a, b, c, d, e, f, g, h) async {
// print('func');

    //
    SharedPreferences prefer = await SharedPreferences.getInstance();
    receiveId = prefer.getStringList('idS');
    fam_id.text = receiveId[1];
    id.text = receiveId[0];
    print(receiveId[0]);
    print(receiveId[1]);
<<<<<<< HEAD
    final String url =
        "http://192.168.1.23:3300/parampara/userpersonal/jobportal";
=======
    final String url = "http://2a0cafcf30b5/parampara/userpersonal/jobportal";
>>>>>>> Malathy
    final response = await http.post(Uri.parse(url), body: {
      'id': a,
      'family_id': b,
      'requester_name': c,
      'posting_date': d,
      'company_name': e,
      'position_title': f,
      'position_end_date': h,
      'number_of_position': g,
    });
    print(response);
    print(response.body);
  }

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
            child: Column(children: [
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
                      image: AssetImage("assets/Jobpost.jpeg"),
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
                          child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 280,
                      height: 50,
                      child: TextFormField(
                          controller: name,
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
                          controller: postingDate,
                          decoration: InputDecoration(
                              prefixIcon: InkWell(
                                  onTap: datePickingStart,
                                  child: Icon(Icons.date_range)),
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
                          controller: companyname,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.supervised_user_circle),
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
                          controller: positiontitle,
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
                          controller: noofposition,
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
                          // controller: username,
                          decoration: InputDecoration(
                              prefixIcon: InkWell(
                                  onTap: datePickingEnd,
                                  child: Icon(Icons.date_range)),
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

                            controller: desc,
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Center(
                        child: TextButton(
                          child: Text(
                            'Post',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            SharedPreferences prefer =
                                await SharedPreferences.getInstance();
                            receiveId = prefer.getStringList('idS');
                            id.text = receiveId[0];
                            fam_id.text = receiveId[1];
                            final String a = id.text;
                            final String b = fam_id.text;
                            final String c = name.text;
                            final String d = postingDate.text;
                            final String e = companyname.text;
                            final String f = positiontitle.text;
                            final String g = noofposition.text;
                            final String h = postingEndDate.text;

                            _read(a, b, c, d, e, f, g, h);
                          },
                        ),
                      ),
                    ),
                  ])))))
        ])));
  }
}
