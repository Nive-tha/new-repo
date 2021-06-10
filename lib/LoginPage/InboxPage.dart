import "package:flutter/material.dart";

class Inboxpage extends StatefulWidget {
  @override
  _InboxpageState createState() => _InboxpageState();
}

class _InboxpageState extends State<Inboxpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inbox"),),
      //  drawer: Drawer(
      //   elevation: 1.0,
      //   child:Column(
      //     children: <Widget>[
      //       UserAccountsDrawerHeader(
      //        accountName: Text('Nivetha'),
      //        accountEmail:Text('nivem17@gmail.com'),
      //        currentAccountPicture: CircleAvatar(
      //          backgroundColor: Colors.white,
      //          child:Text('NM')),
      //       ),
      //       ListTile(
      //         onTap: (){
      //           Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));
      //         },
      //         leading:Icon(Icons.home_sharp),
      //         title:Text("Main"),
      //       ),
      //     ],),

      //  )

    );

  }
}