import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  getUserByUsername(String Username){

  }

  uploadUserInfo(userMap){
    Firestore.instance.collection("Users").add(userMap);
  }
}