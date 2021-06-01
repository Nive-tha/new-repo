import 'package:flutter/material.dart';
import 'package:google/tabspages/accountscreen.dart';
import 'package:google/tabspages/chatscreen.dart';
import 'package:google/tabspages/homescreen.dart';
import 'package:google/tabspages/mapscreen.dart';
import 'package:google/tabspages/treescreen.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int index = 0;
  onClicker(int ind) {
    setState(() {
      index = ind;
      print(index);
    });
  }

  final pages = [
    HomeScreen(),
    ChatScreen(),
    TreeScreen(),
    MapScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.teal,
          selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 30),
          selectedItemColor: Colors.amberAccent,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              // tooltip: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_rounded),
              label: 'Tree',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
          currentIndex: index,
          onTap: onClicker,
          // fixedColor: Colors.green,
        ));
  }
}
