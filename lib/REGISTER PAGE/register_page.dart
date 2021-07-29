import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:googleandfacebook/Login%20Page/login_page.dart';
import 'package:googleandfacebook/REGISTER%20PAGE/REGISTER%20PAGE%20SUPPORT%20FILES/custom_checkbox.dart';
import 'package:googleandfacebook/REGISTER%20PAGE/REGISTER%20PAGE%20SUPPORT%20FILES/custom_text_form_field.dart';
import 'package:googleandfacebook/SHARED%20PREFERENCES/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';

class RegisterPageForParampara extends StatefulWidget {
  RegisterPageForParampara({this.googleId, this.facebookId});
  final googleId;
  final facebookId;
  @override
  _RegisterPageForParamparaState createState() =>
      _RegisterPageForParamparaState();
}

class _RegisterPageForParamparaState extends State<RegisterPageForParampara> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var familyNameController = TextEditingController();
  var familyIdController = TextEditingController();
  var keyboardType, returnText, labelText, controller, value;
  var onChanged;
  bool isChecked = false,
      secureText = false,
      secureText1 = false,
      _selected = false;
  var titleText;
  var obscureText;
  bool obscureText1 = true;
  var suffixIcon, onPressed, storingId, storingData;
  var googleOrFacebookImage;
  var correctGoogleId;
  var correctFacebookId;
  var correctProfileImage;

  @override
  void initState() {
    super.initState();

    getData();
  }

  // hexColor(String color) {
  //   var colors = color.replaceFirst('#', '');
  //   var givenColor = int.parse('0xFF' + colors);
  //   return givenColor;
  // }
  getData() async {
    var gettingData = Shared().shared().then((value) {
      List<String> storingData = value.getStringList('storeData');
      List<String> storingIdAndImage = value.getStringList('idAndProfileImage');
      print(storingIdAndImage);
      setState(() {
        nameController.text = storingData[0].toString();
        emailController.text = storingData[1].toString();
        print(61);
        storingForVisible = storingData[1].toString();
        if (storingIdAndImage[0] == widget.googleId) {
          correctGoogleId = storingIdAndImage[0];
          correctProfileImage = storingIdAndImage[1];
          correctFacebookId = '';
          // print(correctGoogleId);
          // print(correctProfileImage);
          // print(71);
        } else if (storingIdAndImage[0] == widget.facebookId) {
          correctFacebookId = storingIdAndImage[0];
          correctProfileImage = storingIdAndImage[1];
          correctGoogleId = '';
          // print(correctFacebookId);
          // print(correctProfileImage);
          // print(77);
        } else if (storingIdAndImage[0] == '') {
          correctGoogleId = '';
          correctFacebookId = '';
          correctProfileImage = '';
        }
      });
      // print(nameController.text);
      // print(64);
    });
    // print(nameController.text);
    // print(84);
  }

  clear() {
    Shared().shared().then((value) {
      value.clear();
      print('clea');
    });
  }

  hello() {
    return Container();
  }

  apiRegisterPageToPost() async {
    var url = Uri.parse(
        'https://www.cviacserver.tk/parampara/parampara/new_registration');
    var response = await http.post(url, body: {
      'user_name': nameController.text.toString(),
      'email': emailController.text.toString(),
      // 'user_name': 'hello',
      // 'email': 'where',
      'phone': mobileController.text.toString(),
      // 'phone': 3333.toString(),
      // if (passwordController.text.toString() ==
      //     confirmPasswordController.text.toString())
      'pass': passwordController.text.toString(),
      // 'pass': '234234',
      'family_name': familyNameController.text.toString(),
      // 'family_name': 'hello',
      'family_id': familyIdController.text.toString(),
      // 'family_id': '',
      'google_id': correctGoogleId.toString(),
      // 'google_id': '1qqq',
      'face_book': correctFacebookId.toString(),
      // 'face_book': '',
      'profile_image': correctProfileImage.toString()
      // 'profile_image': '1we'
    });
    print(response.body);
    var decodeDetails = json.decode(response.body);
    print(decodeDetails);
    var extractedDetail = decodeDetails['status_code'];
    if (response.statusCode == 200) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => new LoginPage()));
    }
  }

  var storingForVisible = '';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var status = MediaQuery.of(context).padding.top;
    return Scaffold(
      // bottomSheet: hello(),
      body: Container(
        height: height,
        width: width,
        child: Container(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          height: ((height - status)),
          width: width,
          color: Colors.teal.shade400,
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create New Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ((height - status)) * 0.03,
                  ),
                  Container(
                    height: ((height - status)) * 0.06,
                    width: width,
                    child: customTextFormFieldRegister(
                      keyboardType = null,
                      controller = nameController,
                      returnText = "please enter the username",
                      labelText = "Name",
                    ),
                  ),
                  SizedBox(
                    height: ((height - status)) * 0.03,
                  ),
                  Container(
                    height: ((height - status)) * 0.06,
                    width: width,
                    child: customTextFormFieldRegister(
                        keyboardType = null,
                        controller = emailController,
                        returnText = "please enter the email",
                        labelText = "Email"),
                  ),
                  SizedBox(
                    height: ((height - status)) * 0.03,
                  ),
                  Container(
                    height: ((height - status)) * 0.06,
                    width: width,
                    child: customTextFormFieldRegister(
                        keyboardType = null,
                        controller = mobileController,
                        returnText = "please enter the mobile number",
                        labelText = "Mobile no"),
                  ),
                  SizedBox(
                    height: ((height - status)) * 0.03,
                  ),
                  // TextFormField(
                  //   controller: passwordController,
                  //   decoration: InputDecoration(labelText: "hello"),
                  // ),
                  Visibility(
                    visible: storingForVisible == '' ? true : false,
                    child: Column(
                      children: [
                        Container(
                          height: ((height - status)) * 0.06,
                          width: width,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            obscureText: secureText,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "please enter password";
                              } else {
                                return null;
                              }
                            },
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                color: Colors.white,
                                icon: secureText
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    secureText = !secureText;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: HexColor('#04777D'),
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
                        SizedBox(
                          height: ((height - status)) * 0.03,
                        ),
                        Container(
                            height: ((height - status)) * 0.06,
                            width: width,
                            child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                obscureText: secureText1,
                                controller: confirmPasswordController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please enter repassword";
                                  }
                                  if (passwordController.text !=
                                      confirmPasswordController.text) {
                                    return "password does not match";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  suffixIcon: IconButton(
                                    color: Colors.white,
                                    icon: secureText1
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        secureText1 = !secureText1;
                                      });
                                    },
                                  ),
                                  filled: true,
                                  fillColor: HexColor('#04777D'),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
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
                  SizedBox(
                    height: ((height - status)) * 0.03,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.white,
                      ),
                      child: CheckboxListTile(
                        activeColor: Colors.teal,
                        checkColor: Colors.white,
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          'Existing Family Member',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: _selected,
                        onChanged: (value) => setState(() => _selected = value),
                      ),
                    ),
                  ),
                  if (!_selected)
                    Container(
                        height: ((height - status)) * 0.05,
                        width: width,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "please enter Familyname";
                            } else {
                              return null;
                            }
                          },
                          controller: familyNameController,
                          decoration: InputDecoration(
                            labelText: 'FamilyName',

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
                  if (_selected)
                    Container(
                      height: ((height - status)) * 0.05,
                      width: width,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: familyIdController,
                        decoration: InputDecoration(
                          labelText: 'FamilyId',
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
                  SizedBox(
                    height: ((height - status)) * 0.03,
                  ),
                  // customTextFormFieldRegister(
                  //   keyboardType = null,
                  //   controller = familyNameController,
                  //   returnText = "please enter Family name",
                  //   labelText = "Family Name",
                  // ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.white,
                      ),
                      child: CheckboxListTile(
                        activeColor: Colors.teal,
                        checkColor: Colors.white,
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          'I agree with Terms & Condition',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: isChecked,
                        onChanged: (value) => setState(() => isChecked = value),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ((height - status)) * 0.03,
                  ),
                  InkWell(
                    onTap: () {
                      print(470);
                      print(nameController.text);
                      print(emailController.text);
                      print(correctFacebookId);
                      print(mobileController.text);
                      print(correctGoogleId);
                      print(correctProfileImage);
                      print(passwordController);
                      print(familyNameController.text);
                      print(familyIdController.text);
                      print(confirmPasswordController);
                      print(478);
                      apiRegisterPageToPost();
                    },
                    child: Container(
                      height: (height - status) * 0.07,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.cyan.shade400,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text('Create Account'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ((height - status)) * 0.03,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                      height: ((height - status)) * 0.06,
                      width: width,
                      child: Center(
                        child: Text(
                          'Already have an account? Sign In',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    child: Text('logout'),
                    onPressed: () {
                      clear();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
