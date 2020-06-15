import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  getUserByUsername(String Username) async {
    return await Firestore.instance.collection("Users").where("Name" , isEqualTo: Username ).getDocuments();
  }

  uploadUserInfo(userMap){
    Firestore.instance.collection("Users").add(userMap);
  }
}