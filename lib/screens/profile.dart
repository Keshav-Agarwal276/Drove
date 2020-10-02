import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      body: Container(
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
                  Text('Keshav Agarwal', style:
                  TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.white60,letterSpacing: 1.2),
                  )
              ),
              SizedBox(height: 10,),
              Container(
                  margin:EdgeInsets.only(left: 30),
                  child:
                  Text('abcxyz@gmail.com', style:
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
                child: Text('User Name', style:
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
                  Text('Keshav Agarwal', style:
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
                  Text('Male', style:
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
                  Text('123456789', style:
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
                    onTap: (){
                      //delete profile functionality
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
                    onTap: (){
                      //log out functionality
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
