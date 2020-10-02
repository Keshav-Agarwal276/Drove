import 'package:drove/screens/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:drove/screens/login_screen.dart';
import 'package:drove/screens/signup_screen.dart';
import 'package:drove/screens/welcome_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'screens/profile.dart';
import 'screens/update_profile.dart';
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/welcome_screen',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/welcome_screen':
              return PageTransition(
                child: WelcomeScreen(),
                type: PageTransitionType.leftToRight,
                settings: settings,
              );
              break;
            case '/login_screen':
              return PageTransition(
                child: LoginScreen(),
                type: PageTransitionType.leftToRight,
                settings: settings,
              );
              break;
            case '/signup_screen':
              return PageTransition(
                child: SignupScreen(),
                type: PageTransitionType.leftToRight,
                settings: settings,
              );
              break;
            case '/dashboard':
              return PageTransition(
                child: Dashboard(),
                type: PageTransitionType.leftToRight,
                settings: settings,
              );
              break;
               case '/profile_screen':
              return PageTransition(
                child: ProfileScreen(),
                type: PageTransitionType.leftToRight,
                settings: settings,
              );
              break;
            case '/update_profile':
              return PageTransition(
                child: UpdateProfileScreen(),
                type: PageTransitionType.leftToRight,
                settings: settings,
              );
              break;
            default:
              return null;
          }
        });
  }
}
