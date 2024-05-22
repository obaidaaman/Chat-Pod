import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailsRepo {

 static FirebaseFirestore _firestore = FirebaseFirestore.instance;

   static Future<Map<String,dynamic>>  fetchCurrentUserDetails(String id) async{

    DocumentSnapshot details =  await _firestore.collection('users').doc(id).get();


   final Map<String,dynamic> data = details.data() as Map<String,dynamic>;

    return data;

  }

  static Future<bool>  UpdateCurrentUserDetails(String id,String name,String email, String password) async {

     _firestore.collection('users').doc(id).update({

       'full_name' : name,
       'email' : email,
       'password' : password
     }).then((value) {
       return true;
     },);
     return false;
  }
}