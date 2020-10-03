import 'dart:convert';

import 'package:drove/models/bottomnav.dart';
import 'package:drove/services/auth.dart';
import 'package:drove/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

int _currentIndex=1;
Map content;
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
String name ='';
String email='';
String Contactname='-';
String Contactno='-';
String uid='';
String Gender='-';
class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> UserData() async {
    try
    {
      if (_auth.currentUser != null) {
        name = _auth.currentUser.displayName;
        print(_auth.currentUser.displayName);
        email = _auth.currentUser.email;
        print(_auth.currentUser.email);

        return true;
      }
    }
    catch(e){
      print("User Signed Out Failed! $e");
    }
  }

  Future<void> getapi() async {
    try {
        String api = 'https://drove-e14dc.firebaseio.com/.json';
        http.Response response = await http.get(api);
        content =  json.decode(response.body);
        uid = _auth.currentUser.uid;
        setState(() {
          Contactname = content["$uid"]["ContactName"];
          print(Contactname);
          Contactno = content["$uid"]["EmergencyContact"];
          Gender = content["$uid"]["Gender"];
          print(Gender);
        });

      }
  catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    UserData();
    getapi();
    readFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserData(),
        builder:(context,snapshot){
         // Map content = snapshot.data;
          return(snapshot.hasData)?Scaffold(
            bottomNavigationBar: bottomnav(_currentIndex, context),
            backgroundColor: Color(0xff0A0E21),
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/profileBackgroundDark.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin:EdgeInsets.only(left: 30,top: 50),
                          child:
                          Text(name, style:
                          TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.white60,letterSpacing: 1.2),
                          )
                      ),
                      SizedBox(height: 10,),
                      Container(
                          margin:EdgeInsets.only(left: 30),
                          child:
                          Text(email, style:
                          TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white60,letterSpacing: 1.2),
                          )
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 250),
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Color(0xff0A0E21),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 45.0,
                              child: Image.asset('images/boy.png'),
                            ),
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 70,left: 97),
                        child: Text('Contact Name', style:
                        TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.blueGrey,letterSpacing: 1.2),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            child: CircleAvatar(
                                backgroundColor: Color(0xff272B4D),
                                radius: 25.0,
                                child: Icon(Icons.person,color: Colors.blueGrey,)
                            ),
                          ),
                          SizedBox(width: 16,),
                          Text(Contactname, style:
                          TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white60,letterSpacing: 1.2),
                          ),
                        ],
                      ),

                      Container(
                        margin: EdgeInsets.only(top:15,left: 97),
                        child: Text('Gender', style:
                        TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.blueGrey,letterSpacing: 1.2),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            child: CircleAvatar(
                                backgroundColor: Color(0xff272B4D),
                                radius: 25.0,
                                child: Icon(Icons.people,color: Colors.blueGrey,)
                            ),
                          ),
                          SizedBox(width: 16,),
                          Text(Gender, style:
                          TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white60,letterSpacing: 1.2),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top:15,left: 97),
                        child: Text('Emergency Contact', style:
                        TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.blueGrey,letterSpacing: 1.2),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            child: CircleAvatar(
                                backgroundColor: Color(0xff272B4D),
                                radius: 25.0,
                                child: Icon(Icons.call,color: Colors.blueGrey,)
                            ),
                          ),
                          SizedBox(width: 16,),
                          Text(Contactno, style:
                          TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white60,letterSpacing: 1.2),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async{
                              if(await DeleteAccount()){
                              print('Delete Account Successful');
                              deleteFromDatabase(uid);
                              Navigator.pushNamedAndRemoveUntil(
                              context, '/login_screen', (route) => false);
                              }
                              else{
                              print('Error in Deleting Account');
                              }
                            },
                            child: Container(
                              height: 45,
                              width:110,
                              decoration: BoxDecoration(
                                  color: Color(0xff272B4D),
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                              ),
                              child: Center(child: Text('Delete',
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white60),)),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, '/update_profile');
                              //update profile functionality
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Icon(Icons.create,size: 28,color: Colors.blueGrey,),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff272B4D)
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()async{
                              if(await signOutGoogle()){
                                print('Error in LogOut');
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/login_screen', (route) => false);
                              }
                              else{
                                print('Error in LogOut');
                              }
                            },
                            child: Container(
                              height: 45,
                              width:110,
                              decoration: BoxDecoration(
                                  color: Color(0xff272B4D),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                              ),
                              child: Center(child: Text('Log out',
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white60),)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30.0,)
                    ],
                  ),
                ),
              ),
            ),
          ):Scaffold(
            bottomNavigationBar: bottomnav(_currentIndex, context),
            backgroundColor: Color(0xff0A0E21),
            body: Center(child: SpinKitFadingFour(
              color: Colors.white,
              size: 90.0,
            )),
          );
        });
  }
}
