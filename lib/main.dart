import 'package:flutter/material.dart';
import 'package:drove/screens/login_screen.dart';
import 'package:drove/screens/signup_screen.dart';
import 'package:drove/screens/welcome_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome_screen',
      routes: {
        '/login_screen': (context) => LoginScreen(),
        '/signup_screen': (context) => SignupScreen(),
        '/welcome_screen': (context) => WelcomeScreen(),
      },
    );
  }
}
