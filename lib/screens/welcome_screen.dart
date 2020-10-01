import 'dart:async';

import 'package:drove/screens/login_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text('Drove',style: TextStyle(color: Colors.white60,fontSize: 75,fontWeight: FontWeight.w500),),
            SizedBox(height: 30,),
            Container(
              height: 200,
                width: 200,
                child:
                Image.asset('images/logo.png'),
            ),
            SizedBox(height: 250,),
            Text('Made By:',style: TextStyle(color: Colors.white60,fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 15,),
            Text('Team Ninja Turtles',style: TextStyle(color: Colors.white60,fontSize: 16,fontWeight: FontWeight.w500),),

          ],
        ),
      ),
    );
  }
}

