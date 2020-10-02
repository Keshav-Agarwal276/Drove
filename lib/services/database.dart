// import 'package:firebase_database/firebase_database.dart';

// final DBRef = FirebaseDatabase.instance.reference();

// void writeFromDatabase(String name,String uid,String email)
// {
//   DBRef.child("uid").set({
//     'name': name,
//     'email':email,
//   });
// }

// void readFromDatabase(String name,String uid,String email)
// {
//    DBRef.once().then((DataSnapshot dataSnapshot) {
//      print(dataSnapshot.value);
//    });
// }

// void updateFromDatabase(String updatedname,String uid,String updatedemail)
// {
//   DBRef.child('uid').update({
//     'name': updatedname
//   });
// }

// void deleteFromDatabase(String uid)
// {
//   DBRef.child('uid').remove();
// }
