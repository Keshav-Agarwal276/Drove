import 'package:drove/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String Contactname='';
  String Contactno='';
  String Gender='';
  String uid='';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> UserData() async {
    try
    {
      if (_auth.currentUser != null) {
        uid = _auth.currentUser.uid;
        return uid;
      }
    }
    catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    UserData();
  }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(Icons.keyboard_arrow_left,
                            size: 35.0, color: Colors.blueGrey),
                        onPressed: () => Navigator.pop(context)),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 100.0,
                      ),
                      child: Text(
                        'Update Profile',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
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
                         Contactname = value;
                      },
                      style: TextStyle(color: Colors.blueGrey),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.person,
                          color: Colors.blueGrey,
                        ),
                        labelText: 'Contact Name',
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
                         Gender = value;
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
                             Contactno = value;
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
                GestureDetector(
                  onTap: (){
                    if(uid!='')
                      {updateFromDatabase(Contactname, uid, Contactno,Gender);
                      showDialog(
                          context: context,
                          builder: (_) => AssetGiffyDialog(
                            image: Image.asset('images/done.gif'),
                            title: Text(
                              'Profile Updated',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            description: Text(
                              '',
                              textAlign: TextAlign.center,
                              style: TextStyle(),
                            ),
                            entryAnimation: EntryAnimation.RIGHT,
                            onlyOkButton: true,
                            buttonOkColor: Colors.red,
                            onOkButtonPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/profile_screen', (route) => false),
                          ));}
                    else
                      print('Error in UID');
                  },
                  child: Container(
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
                ),
              ],
            ),
          )),
    );
  }
}
