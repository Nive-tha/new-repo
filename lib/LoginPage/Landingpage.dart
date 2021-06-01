import 'dart:math';
// import 'package:faceauth/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google/LoginPage/tabs.dart';
import 'package:google/screens/sign_in_screen.dart';
import 'package:google/utils/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:share/share.dart';
import 'HomePage.dart';
import 'InboxPage.dart';
import 'Mail.dart';
import 'Profile.dart';
import 'homes.dart';
import 'package:google/LoginPage/homes.dart';

void main() {
  runApp(MaterialApp(home: LandingPage()));
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      // routes: <String, WidgetBuilder>{'/Home': (context) => Navigate()}
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.googleLanding, this.faceBookLanding, this.emptyLanding});
  var faceBookLanding;
  var googleLanding;
  var emptyLanding;
  // MyHomePage({Key key, this.title}) : super(key: key);
  //
  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSigningOut = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    save();
  }

  save() async {
    SharedPreferences get = await SharedPreferences.getInstance();
    List<String> prefer = (get.getStringList('a'))!;
    print(prefer);
    print(prefer.length);
    print(prefer[0]);
    print(prefer[1]);

    username.text = prefer[0];
    email.text = prefer[1];
    prefer.clear();
  }

  var profileData;
  var facebookLogin = FacebookLogin();
  bool isLoggedIn = false;

  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }

  var username = TextEditingController();
  var email = TextEditingController();

  final List<Widget> page = [Homes()];
  late String _referralCode;
  var referralCodeGenerator = Random();
  void setReferralCode() {
    if (mounted) {
      setState(() {
        var id = referralCodeGenerator.nextInt(92143543) + 09451234356;
        var randomCode = "Ref-${id.toString().substring(0, 8)}";
        _referralCode = randomCode;
        print(_referralCode);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (widget.faceBookLanding == null && widget.googleLanding == null) {
    //   print("hello empty");
    //   print(widget.faceBookLanding);

    //   username.text = widget.emptyLanding;
    //   email.text = widget.emptyLanding;
    // } else if (widget.faceBookLanding == null && widget.emptyLanding == null) {
    //   print("hello google");

    //   username.text = widget.googleLanding.displayName;
    //   email.text = widget.googleLanding.email;
    // } else if (widget.emptyLanding == null && widget.googleLanding == null) {
    //   print("hello facebook");
    //   print(widget.faceBookLanding);

    //   username.text = widget.faceBookLanding['name'];
    //   email.text = widget.faceBookLanding['email'];
    // } else {
    //   print("nothing worked");
    // }

    // username.text= widget.faceBookLanding['name'];
    // email.text=widget.faceBookLanding['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Parambara'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Navigator.pushNamed(context, '/Home');
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
        // flexibleSpace: SafeArea(
        //   child: Icon(
        //     Icons.camera,
        //     color: Colors.white,
        //     size: 55.0,
        //   ),
        // ),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: 250.0,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Icon(
                        Icons.account_circle,
                        size: 70.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        controller: username,
                        enabled: false,
                        // decoration: InputDecoration(

                        //     // hintText: "username",
                        //     // hintStyle: TextStyle(color: Colors.blue)),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontFamily: 'RobotoMono'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        enabled: false,
                        controller: email,
                        // decoration: InputDecoration(

                        // hintText: "username",
                        // hintStyle: TextStyle(color: Colors.blueGrey)),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontFamily: 'RobotoMono'),
                      ),
                    ],
                  )),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homepage()));
                },
                leading: Icon(Icons.home_sharp),
                title: Text("Home"),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Inboxpage()));
                },
                leading: Icon(Icons.inbox),
                title: Text("Inbox"),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.outbox),
                title: Text("outbox"),
              ),
              ListTile(
                onTap: () {
                  setReferralCode();
                  var Share;
                  Share.share(
                      "https://faq.whatsapp.com/android/chats/how-to-create-and-invite-into-a-group/?lang=en$_referralCode",
                      subject: "Nivetha Family Invites You ");
                },
                leading: Icon(Icons.share),
                title: Text("Invite"),
              ),

              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.notifications),
                title: Text("Notification"),
              ),
              // ListTile(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => Profile(user: '',)));
              //   },
              //   leading: Icon(Icons.settings),
              //   title: Text("MyProfile"),
              // ),

              ListTile(
                onTap: () {
                  _logout();
                  _signIn();
                },
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),

              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              //   leading: Icon(Icons.upload_file),
              //   title: Text("Upload"),
              // ),
            ],
          ),
        ),
      ),
      // body: (Container(
      //   // alignment: Alignment.bottomCenter,
      //   child: Tabs(),
      // )),
      bottomNavigationBar: Tabs(),
    );
  }

  _logout() async {
    await facebookLogin.logOut();
    onLoginStatusChanged(false);
    print("Logged out");
  }

  _signIn() async {
    setState(() {
      _isSigningOut = true;
    });
    await Authentication.signOut(context: context);
    setState(() {
      _isSigningOut = false;
    });
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Mail()));
  }
}
