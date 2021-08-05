import 'package:flutter/material.dart';
import 'package:googleandfacebook/DRAWER%20PAGE/drawer_page.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
    );
  }
}
