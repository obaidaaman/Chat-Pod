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
}
