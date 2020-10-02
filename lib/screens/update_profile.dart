import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: double.infinity,height: 50,),
                Text('Update Profile', style:
                TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white60,letterSpacing: 1.2),
                ),
                SizedBox(height: 30),
                Container(
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
                SizedBox(height: 40,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                      onChanged: (value) {

                      },
                      style: TextStyle(color: Colors.blueGrey),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.person,
                          color: Colors.blueGrey,
                        ),
                        labelText: 'User Name',
                        labelStyle:
                        TextStyle(color: Colors.blueGrey, fontSize: 22),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blueGrey, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF311EBD), width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      )),
                ),
                SizedBox(height: 40,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                      onChanged: (value) {

                      },
                      style: TextStyle(color: Colors.blueGrey),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.email,
                          color: Colors.blueGrey,
                        ),
                        labelText: 'Email',
                        labelStyle:
                        TextStyle(color: Colors.blueGrey, fontSize: 22),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blueGrey, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF311EBD), width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      )),
                ),
                SizedBox(height: 40,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                      onChanged: (value) {

                      },
                      style: TextStyle(color: Colors.blueGrey),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.people,
                          color: Colors.blueGrey,
                        ),
                        labelText: 'Gender',
                        labelStyle:
                        TextStyle(color: Colors.blueGrey, fontSize: 22),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blueGrey, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF311EBD), width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      )),
                ),
                SizedBox(height: 40,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                      onChanged: (value) {

                      },
                      style: TextStyle(color: Colors.blueGrey),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.phone,
                          color: Colors.blueGrey,
                        ),
                        labelText: 'Emergency Contact',
                        labelStyle:
                        TextStyle(color: Colors.blueGrey, fontSize: 22),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blueGrey, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF311EBD), width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      )),
                ),
                SizedBox(height: 40,),
                Container(
                  height: 50,
                  width: 180,
                  child: Center(
                      child: Text(
                        'Update Profile',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 22),
                      )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF311EBD),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
