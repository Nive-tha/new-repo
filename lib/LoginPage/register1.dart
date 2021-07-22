import 'dart:convert';
// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google/LoginPage/reg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:cool_alert/cool_alert.dart';
import 'Alert.dart';
import 'AlertRegister.dart';
import 'Mail.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Register1 extends StatefulWidget {
  Register1({this.faceBookReceived, this.googleReceived, this.empty});
  var faceBookReceived;
  var googleReceived;
  var empty;
  var saveKeyGoogle = "";
  var saveKeyFacebook = "";

  @override
  _Register1State createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  bool _selected = false;
  bool _selected1 = false;
  bool securetext = true;
  bool securetext1 = true;
  var googlePic;
  var faceBookpic;
  var mailPic;

  @override
  void initState() {
    super.initState();
  }

  var saveKeyGoogle = "";
  var saveKeyFacebook = "";
  var username = TextEditingController();
  var email = TextEditingController();
  var mblno = TextEditingController();
  var password = TextEditingController();
  var confirmpassword = TextEditingController();
  var familyid = TextEditingController();
  var familyname = TextEditingController();
  var google = TextEditingController();
  var facebook = TextEditingController();
  var Url = TextEditingController();

  Color color = const Color(0xff023C3F);
  FocusNode _focusNode = FocusNode();

  ShowLoad() {
    SpinKitFadingCircle(color: Colors.black);
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: 'Registration Successfully',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.teal,
        textColor: Colors.white);
  }

  Future _read(a, b, c, d, g, e, f, k, i, j) async {
    final String url =
        "http://www.cviacserver.tk/parampara/parampara/new_registration";
    final response = await http.post(Uri.parse(url), body: {
      'user_name': a,
      'email': b,
      'phone': c,
      if (d == e) 'pass': d,
      'family_name': f,
      'family_id': g,
      'google_id': k,
      'face_book': i,
      "profile_image": j,
    });
    print(response);
    print(response.body);
    var receivedDetails = json.decode(response.body);
    print(receivedDetails);
    var extractedDetail = receivedDetails['user'][0]['family_id'].toString();
    print(extractedDetail);
    var extractedDetail1 = receivedDetails['user'][0]['id'].toString();
    print(extractedDetail1);
    List<String> stringList = [extractedDetail1, extractedDetail];
    SharedPreferences prefer = await SharedPreferences.getInstance();
    await prefer.setStringList('idS', stringList);
    if (response.statusCode == 200) {
      ShowLoad();
      showToast();
      print(a);
      SharedPreferences sent = await SharedPreferences.getInstance();

      sent.setString('sentFromRegister1', a);

      print(81);
      if (widget.googleReceived == null && widget.faceBookReceived == null) {
        print(a);
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => new Mail()));
      } else if (widget.googleReceived == null && widget.empty == null) {
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => new Reg()));
      } else if (widget.faceBookReceived == null && widget.empty == null) {
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => new Reg()));
      } else {
        print(92);
      }
    } else {
      print(94);
    }
    // if(response.statusCode == 200){
    //
    //   print(widget.faceBookReceived['name']);
    //   print(widget.googleReceived.displayName);
    //   print(widget.empty);
    // print(a);
    // print(85);
    // if(widget.faceBookReceived['name']== null) {
    //   print(' facebook null');
    // }
    // else if(widget.googleReceived.displayName == null){
    // print('google null') ;
    // }
    // else if(widget.empty == null){
    //   print('empty null');
    // }
    // else{
    //   print('inside block');
    // }
    //
    // }
    // else{
    //   print(response.statusCode);
    // }
  }

  @override
  Widget build(BuildContext context) {
      var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (widget.faceBookReceived == null && widget.googleReceived == null) {
      print("hello empty");
      print(widget.faceBookReceived);
      print(widget.googleReceived);

      // username.text = widget.empty;
      // email.text = widget.empty;
    } else if (widget.faceBookReceived == null && widget.empty == null) {
      print("hello google");
      google.text = widget.googleReceived.uid;
      Url.text = widget.googleReceived.photoURL!;
      username.text = widget.googleReceived.displayName;
      email.text = widget.googleReceived.email;
      // googlePic = widget.googleReceived.photoUrl;
    } else if (widget.empty == null && widget.googleReceived == null) {
      print("hello facebook");
      print(widget.faceBookReceived);
      Url.text = widget.faceBookReceived['picture']['data']['url'];
      facebook.text = widget.faceBookReceived['id'];
      username.text = widget.faceBookReceived['name'];
      email.text = widget.faceBookReceived['email'];
      // faceBookpic = widget.faceBookReceived['picture']['data']['url'];
    } else {
      print("nothing worked");
    }
    //
    //
    print(widget.googleReceived);
    print(widget.faceBookReceived);

    _focusNode.addListener(() {
      setState(() {
        color = _focusNode.hasFocus ? Colors.white : Colors.white;
      });
    });
    return Scaffold(
 
      body: Container(
height:height,
width: width,
         decoration: new BoxDecoration(
        image: new DecorationImage(
          image: ExactAssetImage('assets/back.png'),
          fit: BoxFit.cover,
        ),
      ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: SingleChildScrollView(
              child: Column(children: [
            Form(
         
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Create New Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat"),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: InkWell(
                        onTap: () {},
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: username,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: _focusNode.hasFocus
                                  ? Colors.white
                                  : Colors.white,
                            ),
                            filled: true,
                            fillColor: HexColor("#04777D"),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              borderSide:
                                  BorderSide(color: Colors.cyan, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              borderSide:
                                  BorderSide(color: Colors.cyan, width: 1),
                            ),
                            prefixIcon: Icon(Icons.verified_user_rounded,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      height: 50,
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter the username";
                            }
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: HexColor("#04777D"),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                                borderSide:
                                    BorderSide(color: Colors.cyan, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                                borderSide:
                                    BorderSide(color: Colors.cyan, width: 1),
                              ),
                              prefixIcon:
                                  Icon(Icons.account_circle, color: Colors.white),
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.white))),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter MobileNumber";
                          }
                        },
                        controller: mblno,
                        decoration: InputDecoration(
                          labelText: 'MobileNumber',
                          labelStyle: TextStyle(
                            color:
                                _focusNode.hasFocus ? Colors.white : Colors.white,
                          ),
                          filled: true,
                          fillColor: HexColor("#04777D"),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                            borderSide: BorderSide(color: Colors.cyan, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                            borderSide: BorderSide(color: Colors.cyan, width: 1),
                          ),
                          prefixIcon: Icon(Icons.verified_user_rounded,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Visibility(
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              obscureText: securetext1,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please enter password";
                                }
                              },
                              controller: password,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: _focusNode.hasFocus
                                      ? Colors.white
                                      : Colors.white,
                                ),
                                suffixIcon: IconButton(
                                  color: Colors.white,
                                  icon: securetext1
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      securetext1 = !securetext1;
                                    });
                                  },
                                ),
                                filled: true,
                                fillColor: HexColor("#04777D"),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0)),
                                  borderSide:
                                      BorderSide(color: Colors.cyan, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0)),
                                  borderSide:
                                      BorderSide(color: Colors.cyan, width: 1),
                                ),
                                prefixIcon: Icon(Icons.verified_user_rounded,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                              width: 300,
                              child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  obscureText: securetext1,
                                  controller: confirmpassword,
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Please enter repassword";
                                  //   }
                                  //   if (password.text != confirmpassword.text) {
                                  //     return "password does not match";
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: InputDecoration(
                                    labelText: 'Confirm Password',
                                    labelStyle: TextStyle(
                                      color: _focusNode.hasFocus
                                          ? Colors.white
                                          : Colors.white,
                                    ),
                                    suffixIcon: IconButton(
                                      color: Colors.white,
                                      icon: securetext1
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility),
                                      onPressed: () {
                                        setState(() {
                                          securetext1 = !securetext1;
                                        });
                                      },
                                    ),
                                    filled: true,
                                    fillColor: HexColor("#04777D"),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    //
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16.0)),
                                      borderSide: BorderSide(
                                          color: Colors.cyan, width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16.0)),
                                      borderSide: BorderSide(
                                          color: Colors.cyan, width: 1),
                                    ),

                                    prefixIcon: Icon(Icons.verified_user_rounded,
                                        color: Colors.white),
                                  )))
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Theme(
                        data:
                            ThemeData(unselectedWidgetColor: HexColor("#04777D")),
                        child: CheckboxListTile(
                          selectedTileColor: HexColor("#04777D"),
                          activeColor: HexColor("#04777D"),
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            'Existing FamilyMember',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: _selected,
                          onChanged: (value) =>
                              setState(() => _selected = value!),
                        ),
                      ),
                    ),
                    if (!_selected)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Container(
                            width: 300,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please enter Familyname";
                                }
                              },
                              controller: familyname,
                              decoration: InputDecoration(
                                labelText: 'FamilyName',
                                labelStyle: TextStyle(
                                  color: _focusNode.hasFocus
                                      ? Colors.white
                                      : Colors.white,
                                ),
                                filled: true,
                                fillColor: HexColor("#04777D"),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                //
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0)),
                                  borderSide:
                                      BorderSide(color: Colors.cyan, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0)),
                                  borderSide:
                                      BorderSide(color: Colors.cyan, width: 1),
                                ),

                                prefixIcon: Icon(Icons.verified_user_rounded,
                                    color: Colors.white),
                              ),
                            )),
                      ),
                    if (_selected)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Container(
                          width: 300,
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            controller: familyid,
                            decoration: InputDecoration(
                              labelText: 'FamilyId',
                              labelStyle: TextStyle(
                                color: _focusNode.hasFocus
                                    ? Colors.white
                                    : Colors.white,
                              ),
                              filled: true,
                              fillColor: HexColor("#04777D"),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                                borderSide:
                                    BorderSide(color: Colors.cyan, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                                borderSide:
                                    BorderSide(color: Colors.cyan, width: 1),
                              ),
                              prefixIcon: Icon(Icons.verified_user_rounded,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Theme(
                        data:
                            ThemeData(unselectedWidgetColor: HexColor("#04777D")),
                        child: CheckboxListTile(
                          selectedTileColor: HexColor("#04777D"),
                          activeColor: HexColor("#04777D"),
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            'I agree with Terms & Conditions',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: _selected1,
                          onChanged: (value) =>
                              setState(() => _selected1 = value!),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ButtonTheme(
                      minWidth: 320.0,
                      height: 50.0,
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                    
                            final String a = username.text;
                            final String b = email.text;
                            final String c = mblno.text;
                            final String d = password.text;
                            final String e = confirmpassword.text;
                            final String f = familyname.text;
                            final String g = familyid.text;
                            final String k = google.text;
                            final String i = facebook.text;
                            final String j = Url.text;

                            _selected = false;

                            _read(a, b, c, d, g, e, f, k, i, j);
                       
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Mail()));
                      },
                      child: Text('Already have an Account? SignIn',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white)),
                    ))
                  ],
                ))
          ])),
        ),
      ),
    );
  }
}
