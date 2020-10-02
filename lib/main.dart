import 'package:drove/screens/detect_screen.dart';
import 'package:drove/screens/profile.dart';
import 'package:drove/screens/update_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:drove/screens/login_screen.dart';
import 'package:drove/screens/signup_screen.dart';
import 'package:drove/screens/welcome_screen.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:'/welcome_screen',
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
                child:  DetectScreen(title: 'Detect Drowseyness'),
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
