import 'package:drove/screens/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'database.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

// Help  the User to Sign In With Google Account
Future<bool> signInWithGoogle() async {
  // Trigger the authentication flow
  try {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    writeFromDatabase(uid);
    // Once signed in, return the UserCredential
    if (await FirebaseAuth.instance.signInWithCredential(credential) != null)
      return true;
    else
      return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

// Help  the User to Sign Up With Email And Password
Future<bool> signUp(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final EmailAuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    if ((await FirebaseAuth.instance.signInWithCredential(credential))
            .toString() !=
        null) {
      print((await FirebaseAuth.instance.signInWithCredential(credential))
          .toString());
      writeFromDatabase(uid);
      return true;
    }

    return false;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      return false;
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      return false;
    }
  } catch (e) {
    print(e.toString());
  }
  return false;
}

// Help  the User to Sign In With Email And Password
Future<bool> signIn(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    return false;
  }
}

// Help  the User to Sign Out
Future<bool> signOutGoogle() async {
  try {
    await FirebaseAuth.instance.signOut();
    print("User Signed Out");
    return true;
  } catch (e) {
    print("User Signed Out Failed! $e");
    return false;
  }
}

// Help  the User to reset the password
Future<void> resetPassword(String email) async {
  await _auth.sendPasswordResetEmail(email: email);
}

// Help to check the User is valid or not
Future<bool> UserAuth() async {
  try {
    if (_auth.currentUser != null) {
      print(_auth.currentUser.uid);
      return true;
    }
    return false;
  } catch (e) {
    print("User Signed Out Failed! $e");
    return false;
  }
}

// Delete the Current Account
Future<bool> DeleteAccount() async {
  try {
    await FirebaseAuth.instance.currentUser.delete();
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'requires-recent-login') {
      print(
          'The user must reauthenticate before this operation can be executed.');
      return false;
    }
  }
}


// onPressed: () async{

// },