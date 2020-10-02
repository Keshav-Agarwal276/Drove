import 'package:drove/services/auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Text('Dashboard Here'),
          RaisedButton(onPressed: () async{
            if(await signOutGoogle()){
              print('Error in LogOut');
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login_screen', (route) => false);
            }
            else{
              print('Error in LogOut');
            }
          },
            child: Text('Log Out'),
          )
        ],
      )),
    );
  }
}
