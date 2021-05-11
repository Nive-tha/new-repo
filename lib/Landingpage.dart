import 'dart:math';
import 'package:faceauth/tabs.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'HomePage.dart';
import 'InboxPage.dart';
import 'Profile.dart';
import 'homes.dart';

void main() {
  runApp(MaterialApp(home: LandingPage()));
}

class LandingPage extends StatelessWidget {
  final appTitle = 'Drawer Demo';
  // This widget is the root of your application.
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
  // MyHomePage({Key key, this.title}) : super(key: key);
  //
  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
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
                      Icon(

                        Icons.account_circle,
                        size: 70.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),

                      Text(
                        "Nivetha",
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      ),
                      Text("nivem17@gmail.com",
                          style:
                          TextStyle(color: Colors.white54, fontSize: 15.0))
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
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile(user: 'user')));
                },
                leading: Icon(Icons.settings),
                title: Text("MyProfile"),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.add_box_outlined),
                title: Text("About"),
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
      body: (Container(
        // alignment: Alignment.bottomCenter,
        child: Tabs(),
      )),
    );
  }
}
