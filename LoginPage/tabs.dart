import 'package:flutter/material.dart';
import 'settings.dart';
import 'wallet.dart';
import 'homes.dart';

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

  final pages = [Homes(), Wallet(), Setting()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
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
          currentIndex: index,
          onTap: onClicker,
          fixedColor: Colors.green,
        ));
  }
}

// Widget bullet() {

//   int index = 0;
//   onClicker(int ind) {
//     index = ind;
//     print(index);
//   }

//   final pages = <Widget>[Homes(), Wallet(), Setting()];
//   return Scaffold(
//     body: pages[index],
//     bottomNavigationBar: BottomNavigationBar(
//       type: BottomNavigationBarType.shifting,
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//             backgroundColor: Colors.blueGrey),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.wallet_giftcard),
//             label: 'Wallet',
//             backgroundColor: Colors.black),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//             backgroundColor: Colors.brown),
//       ],
//       currentIndex: index,
//       onTap: onClicker,
//       fixedColor: Colors.green,
//     ),
//   );
// }
