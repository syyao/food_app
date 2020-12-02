import 'package:flutter/material.dart';

import 'favoritePage.dart';
import 'pageHom.dart';
import 'profil.dart';
import 'schedule.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int pageIndex = 0;
  List viewList = [
    PageHom(),
    FavoriteScreen(),
    Profil(),
    Schedule(),
  ];
  void onTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: viewList.elementAt(pageIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromRGBO(239, 46, 41, 1),
          unselectedItemColor: Colors.grey,
          currentIndex: pageIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: onTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text(""),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: Icon(Icons.favorite_border),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: Icon(
                Icons.schedule,
              ),
            ),
          ],
        ));
  }
}
