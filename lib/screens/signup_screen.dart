import 'package:flutter/material.dart';
// #272B4D
class SignupScreen extends StatelessWidget {
  String name = 'Abc';
  String email = 'abc@gmail.com';
  String password = 'abcxyz';
  String confirmPassword = 'abcxyz';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      body: SafeArea(
          child:Container(
        width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 45,),
                Text('Sign Up',style: TextStyle(color: Colors.blueGrey,fontSize: 22,fontWeight: FontWeight.w500),),
                SizedBox(height: 55,),
                Text('Welcome',style: TextStyle(color: Colors.white60,fontSize: 29,fontWeight: FontWeight.w500),),
                SizedBox(height: 20,),
                Text('Sign up with your email and password',style: TextStyle(color: Colors.blueGrey,fontSize: 14,fontWeight: FontWeight.w500),),
                  SizedBox(height: 35,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                        onChanged:(value){
                          name = value;
                        },
                        style: TextStyle(color: Colors.blueGrey),
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                        InputDecoration(
                          suffixIcon: Icon(Icons.person,color: Colors.blueGrey,),
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.blueGrey,fontSize: 25),
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey, width: 1.5),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF311EBD), width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: 45,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                        onChanged:(value){
                          email = value;
                        },
                      keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.blueGrey),
                        decoration:
                        InputDecoration(
                          suffixIcon: Icon(Icons.email,color: Colors.blueGrey,),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.blueGrey,fontSize: 22),
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey, width: 1.5),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF311EBD), width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: 45,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                        onChanged:(value){
                          password = value;
                        },
                        style: TextStyle(color: Colors.blueGrey),
                        obscureText: true,
                        decoration:
                        InputDecoration(
                          suffixIcon: Icon(Icons.lock,color: Colors.blueGrey,),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.blueGrey,fontSize: 25),
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey, width: 1.5),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF311EBD), width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: 45,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                        onChanged:(value){
                          confirmPassword = value;
                        },
                        style: TextStyle(color: Colors.blueGrey),
                        obscureText: true,
                        decoration:
                        InputDecoration(
                          suffixIcon: Icon(Icons.lock,color: Colors.blueGrey,),
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: Colors.blueGrey,fontSize: 22),
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey, width: 1.5),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF311EBD), width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: 60,),
                  GestureDetector(
                    onTap: (){
                      //signup function goes here
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      child: Center(child: Text('Sign Up',style: TextStyle(color: Colors.blueGrey,fontSize: 22),)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:Color(0xFF311EBD),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
              ],),
            ),
      ),
      ),
    );
  }
}
