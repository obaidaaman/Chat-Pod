import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthLogRepo {

 static  logInUser(String email, String password) async {
   try{

     var creds = await FirebaseAuth.instance
         .signInWithEmailAndPassword(email: email, password: password);

     return creds.user;
   }  on FirebaseAuthException catch (e){
     return null;
   }
  }

  static SignUpUser(String email, String password) async {
    try {
      final authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return authResult;
    } on FirebaseAuthException catch (e) {
      if(e.code == 'weak-password'){
        return 'The password provided is too weak';
      }
      else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return null;
    }
  }
  static CreateDatabase(String name , String email, String password, String id) async{
   try{
     CollectionReference userID = FirebaseFirestore.instance.collection('users');
     final users = userID.doc(id);

     return  await users.set({
       'full_name' : name,
       'email' : email,
       'password' : password,
       'user_id' : id
     }).then((value) {
       print('User added');

     }).catchError((error)  {

     });

   }  on FirebaseException catch(e){

     return e.code;
   }

  }
}
