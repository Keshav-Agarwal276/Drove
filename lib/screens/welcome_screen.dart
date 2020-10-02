import 'dart:async';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'Drove',
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: 75,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              width: 200,
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(
              height: 250,
            ),
            Text(
              'Made By:',
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Team Ninja Turtles',
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  void getUser() async {
    bool verify = await UserAuth();
    if (verify)
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(
              context, '/dashboard', (route) => false));
    else
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(
              context, '/login_screen', (route) => false));
  }
}
