import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:googleandfacebook/Google%20And%20Facebook/facebook/facebook_display.dart';
import 'package:googleandfacebook/Google%20And%20Facebook/google/google_display.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:googleandfacebook/LOGIN%20PAGE%20BREAKDOWN%20PAGES/custom_flat_button.dart';
import 'package:googleandfacebook/LOGIN%20PAGE%20BREAKDOWN%20PAGES/divider_work.dart';
import 'package:googleandfacebook/LOGIN%20PAGE%20BREAKDOWN%20PAGES/navigate_to_register_page.dart';
import 'package:googleandfacebook/LOGIN%20PAGE%20BREAKDOWN%20PAGES/pages_size.dart';
import 'package:googleandfacebook/REGISTER%20PAGE/register_page.dart';
import 'package:googleandfacebook/SHARED%20PREFERENCES/shared_preferences.dart';
import 'package:googleandfacebook/STAY%20CONNECTED%20PAGE/stay_connected.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var returnText, storeHere;
  var controller;
  var response;
  var keyboardType;
  var validator;
  var labelText;
  var functionHere;
  var widthGiven;
  var textGiven;
  var onTap;
  var imageGiven;
  var icon;
  var heightHere;
  var widthHere;
  var statusHere;
  bool isLoggedIn = false;
  bool isChecked = false;
  var facebookDetails;
  var facebookFinalDetails;
  @override
  void initState() {
    super.initState();
    // Shared().shared().then((value) {
    //   value.clear();
    // });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var status = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
                'assets/Login Page Folder/Images/background_image.png'),
          ),
        ),
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          top: 50,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: ((height - status)) * 0.10,
                width: width,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: status,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: ((height - status)) * 0.5,
                width: width,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AllSize().customTextFormField(
                        keyboardType = TextInputType.emailAddress,
                        controller = emailController,
                        returnText = "please enter your userName",
                        labelText = "username or email",
                        icon = Icons.account_circle,
                      ),
                      SizedBox(
                        height: ((height - status) * 0.5) * 0.05,
                      ),
                      AllSize().customTextFormField(
                        keyboardType = null,
                        controller = passwordController,
                        returnText = "please enter password",
                        labelText = "password",
                        icon = Icons.lock,
                      ),
                      SizedBox(
                        height: ((height - status) * 0.5) * 0.05,
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
                                'Remember me',
                                style: TextStyle(color: Colors.white),
                              ),
                              value: isChecked,
                              onChanged: (value) =>
                                  setState(() => isChecked = value)),
                        ),
                      ),
                      Container(
                        height: ((height - status) * 0.5) * 0.15,
                        width: width,
                        child: FlatButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              print(emailController.text);
                              print(passwordController.text);
                              // signInAsOtherUser(emailController.text,
                              //     passwordController.text);
                              var gettingStatus = await signInAsOtherUser(
                                  emailController.text,
                                  passwordController.text);
                              var statusCode = gettingStatus['status'];
                              print(statusCode);
                              var userName =
                                  gettingStatus['User'][0]['user_name'];
                              print(userName);
                              var userEmail = gettingStatus['User'][0]['email'];
                              print(userEmail);
                              storingEmailUsername(userName, userEmail);
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.lightBlue.shade900,
                        ),
                      ),
                      SizedBox(
                        height: ((height - status) * 0.5) * 0.05,
                      ),
                      InkWell(
                        child: new Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.white),
                        ),
                        // onTap: () => Navigator.pushReplacement(
                        //     context,
                        //     new MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             new ForgetPass()))
                      ),
                      SizedBox(
                        height: ((height - status) * 0.5) * 0.05,
                      ),
                      customDivider(),
                    ],
                  ),
                ),
              ),
              Container(
                height: ((height - status)) * 0.07,
                width: width,
                child: customFlatButtom(
                    functionHere = signInWithGoogle,
                    widthGiven,
                    textGiven = "Continue with Google",
                    imageGiven = 'assets/Login Page Folder/Images/google.jpeg'),
              ),
              SizedBox(
                height: ((height - status) * 0.5) * 0.05,
              ),
              Container(
                height: ((height - status)) * 0.07,
                width: width,
                child: customFlatButtom(
                    functionHere = signInWithFacebook,
                    widthGiven,
                    textGiven = "Continue with Facebook",
                    imageGiven =
                        'assets/Login Page Folder/Images/facebook.jpeg'),
              ),
              SizedBox(
                height: ((height - status) * 0.5) * 0.1,
              ),
              navigateToRegisterPageWidget(onTap = navigateToRegisterPage,
                  heightHere = height, widthHere = width, statusHere = status),
            ],
          ),
        ),
      ),
    );
  }

  signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    FirebaseAuth.instance.signInWithCredential(credential);
    apiGoogle(googleUser);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => GoogleDisplayPage(
    //               userDetails: googleUser,
    //             )));
  }

  signInWithFacebook() async {
    FacebookAuth.instance
        .login(permissions: ["public_profile", "email"]).then((value) {
      FacebookAuth.instance.getUserData().then((userData) async {
        setState(() {
          isLoggedIn = true;
          facebookDetails = userData;
        });
      }).whenComplete(() {
        setState(() {
          facebookFinalDetails = facebookDetails;
        });
        apiFacebook(facebookFinalDetails);
      });
    });
  }

  apiFacebook(facebookDetailToPost) async {
    var url = Uri.parse('https://www.cviacserver.tk/parampara/exists/facebook');
    response =
        await http.post(url, body: {'face_book': facebookDetailToPost['id']});
    var decodedFacebookDetail = json.decode(response.body);
    print(decodedFacebookDetail);
    print(response.statusCode);
    print(decodedFacebookDetail['status_code']);
    if (response.statusCode == decodedFacebookDetail['staus_code']) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => StayConnectedPage()));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => RegisterPageForParampara(
                    facebookId: facebookDetailToPost['id'],
                    googleId: null,
                  )));
    }
    storingIdAndProfileImage(facebookDetailToPost['id'],
        facebookDetailToPost["picture"]["data"]["url"]);
    storingEmailUsername(
        facebookDetailToPost['name'], facebookDetailToPost['email']);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) =>
    //             FacebookDisplay(details: facebookDetailToPost)));
  }

  apiGoogle(googleDetailToPost) async {
    var url = Uri.parse('https://www.cviacserver.tk/parampara/exists/google');
    response = await http.post(url, body: {'google_id': googleDetailToPost.id});
    var decodedFacebookDetail = json.decode(response.body);
    print(decodedFacebookDetail);
    print(response.statusCode);
    print(decodedFacebookDetail['status_code']);
    if (response.statusCode == decodedFacebookDetail['staus_code']) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => StayConnectedPage()));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => RegisterPageForParampara(
                    googleId: googleDetailToPost.id,
                    facebookId: null,
                  )));
    }
    storingIdAndProfileImage(
        googleDetailToPost.id, googleDetailToPost.photoUrl);
    storingEmailUsername(
        googleDetailToPost.displayName, googleDetailToPost.email);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => GoogleDisplayPage(
    //               userDetails: googleDetailToPost,
    //             )));
  }

  signInAsOtherUser(email, password) async {
    var url = Uri.parse('https://www.cviacserver.tk/parampara/user_login');
    response = await http.post(url, body: {'email': email, 'pass': password});
    var decodedNormalUserDetail = json.decode(response.body);
    print(decodedNormalUserDetail);

    if (decodedNormalUserDetail['statuscode'] == 200) {
      final snackBar = SnackBar(
        backgroundColor: Colors.teal,
        content: Text('Login Successfully'),
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => StayConnectedPage()));
    } else {
      final snackBar = SnackBar(
        content: Text('Login Failed'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => StayConnectedPage()));
    }
    // var decodedId = decodedNormalUserDetail['User'][0]['id'];
    // var decodedFamilyId = decodedNormalUserDetail['User'][0]['family_id'];
    // List decodedList = [decodedId, decodedFamilyId];
    // SharedPreferences decodedListToSave = await SharedPreferences.getInstance();
    // decodedListToSave.setStringList('sendingIdAndFamilyId', decodedList);
    return decodedNormalUserDetail;
  }

  storingEmailUsername(userName, userEmail) async {
    List<String> storing = [userName, userEmail];
    print(storing);
    print(320);
    Shared()
        .shared()
        .then((value) => value.setStringList('storeData', storing));
  }

  storingIdAndProfileImage(userId, profileImage) async {
    List<String> storingIdAndImage = [userId, profileImage];
    print(storingIdAndImage);
    print(326);
    Shared().shared().then(
        (value) => value.setStringList('idAndProfileImage', storingIdAndImage));
  }

  navigateToRegisterPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (ctx) => RegisterPageForParampara()));
  }
  // logOutForFacebook() {
  //   return FacebookAuth.instance.logOut().then((value) {
  //     setState(() {
  //       isLoggedIn = false;
  //     });
  //   });
  // }
}
