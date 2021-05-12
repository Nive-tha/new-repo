import 'package:flutter/material.dart';
import 'package:googleandfacebook/bottom_navigation_bar/home_page.dart';
import 'package:googleandfacebook/bottom_navigation_bar/setting_page.dart';
import 'package:googleandfacebook/bottom_navigation_bar/wallet_page.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  var index = 0;
  List page = [Homes(), SettingsPage(), WalletPage()];
  changingPage(int indexes) {
    setState(() {
      index = indexes;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[index],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_giftcard),
              label: 'Wallet',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.brown),
        ],
        fixedColor: Colors.green,
        currentIndex: index,
        onTap: changingPage,
      ),
    );
  }
}
