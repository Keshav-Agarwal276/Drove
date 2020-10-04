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
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(10.0),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('images/logo.png'),
            ),
          ),
        ),
      )
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
