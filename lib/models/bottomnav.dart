import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

Widget bottomnav(_currentIndex, context) {
  return CurvedNavigationBar(
    backgroundColor: Color(0xff0A0E21),
    color: Color(0xff414885),
    buttonBackgroundColor: Colors.blueGrey,
    height: 52.0,
    index: _currentIndex,
    animationDuration: Duration(
      milliseconds: 200,
    ),
    animationCurve: Curves.bounceInOut,
    items: <Widget>[
      Icon(Icons.home, size: 34, color: Colors.white70),
      Icon(Icons.person, size: 34, color: Colors.white70),
    ],
    onTap: (index) {
      if (index == 0 && _currentIndex != index) {
        Navigator.pushReplacementNamed(context, '/dashboard');
        print('Going to Dashboard');
      } else if (index == 1 && _currentIndex != index) {
        Navigator.pushReplacementNamed(context, '/profile_screen');
        print('Going to Meal Selection');
      }
    },
  );
}
