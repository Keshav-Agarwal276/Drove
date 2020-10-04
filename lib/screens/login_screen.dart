import 'package:drove/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';

  String password = '';

  String error = '';
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      body: ModalProgressHUD(
        opacity: 0.1,
        progressIndicator: SpinKitFadingCircle(
          size: 70.0,
          color: Colors.white,
        ),
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    'Log In',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 29,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Log In with your email and password',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 95,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        style: TextStyle(color: Colors.blueGrey),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.blueGrey,
                          ),
                          labelText: 'Email',
                          labelStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 25),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        style: TextStyle(color: Colors.blueGrey),
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Colors.blueGrey,
                          ),
                          labelText: 'Password',
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        showSpinner = true;
                      });

                      if (LoginCheck()) {
                        setState(() {
                          showSpinner = false;
                        });
                        showDialog(
                            context: context,
                            builder: (_) => AssetGiffyDialog(
                                  image: Image.asset('images/error.gif'),
                                  title: Text(
                                    error,
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
                                  onOkButtonPressed: () => Navigator.pop(context),
                                ));
                      } else {
                        print(email);
                        print(password);
                        bool verify = await signIn(email, password);
                        if (verify)
                          {
                            Navigator.pushNamedAndRemoveUntil(
                              context, '/dashboard', (route) => false);}
                        else {
                          setState(() {
                            showSpinner = false;
                          });
                          print('Login Error');
                          showDialog(
                              context: context,
                              builder: (_) => AssetGiffyDialog(
                                    cornerRadius: 50.0,
                                    image: Image.asset('images/error.gif'),
                                    title: Text(
                                      'Please Try Again!',
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
                                    onOkButtonPressed: () =>
                                        Navigator.pop(context),
                                  ));
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      child: Center(
                          child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white70, fontSize: 22),
                      )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF311EBD),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          bool verify = await signInWithGoogle();
                          if (verify) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/dashboard', (route) => false);
                          } else {
                            print('Login Error');
                            setState(() {
                              showSpinner = false;
                            });
                            showDialog(
                                context: context,
                                builder: (_) => AssetGiffyDialog(
                                      cornerRadius: 50.0,
                                      image: Image.asset('images/error.gif'),
                                      title: Text(
                                        'Please Try Again!',
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
                                      onOkButtonPressed: () =>
                                          Navigator.pop(context),
                                    ));
                          }
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 22.0,
                            child: Image.asset('images/googlesignin.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      GestureDetector(
                        onTap: null,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue[700],
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 22.0,
                            child: Image.asset('images/facebook.png'),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.06,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?\t  ',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/signup_screen'),
              child: Text(
                'Sign Up',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  bool LoginCheck() {
    String s = "";
    if (email != "" && password != "") {
      return false;
    } else if (email == "" && password != "") {
      s = "Please Enter a E-mail ID!";
      setState(() {
        error = s;
        print(error);
      });
      return true;
    } else if (email != "" && password == "") {
      s = "Please Enter a Password!";
      setState(() {
        error = s;
        print(error);
      });
      return true;
    } else {
      s = "Please fill Email and Password!";
      setState(() {
        error = s;
        print(error);
      });
      return true;
    }
  }
}
