import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

final DBRef = FirebaseDatabase.instance.reference();

void writeFromDatabase(String uid) async{

  DBRef.child('$uid').set({
    'ContactName':"-",
    'EmergencyContact':"-",
    'Gender':"-"
  });
}

void readFromDatabase()
{
   DBRef.once().then((DataSnapshot dataSnapshot) {
     print(dataSnapshot.value);
   });
}

void updateFromDatabase(String updatedname,String uid,String updatedno,String gender)
{
  DBRef.child('$uid').update({
    'ContactName': updatedname,
    'EmergencyContact':updatedno,
    'Gender':gender
  });
}

void deleteFromDatabase(String uid)
{
  DBRef.child('$uid').remove();
}
