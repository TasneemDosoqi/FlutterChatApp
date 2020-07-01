import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserInfo(String email) async {
    return Firestore.instance
        .collection("Users")
        .where("Email", isEqualTo: email)
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserByUsername(String Username) async {
    return await Firestore.instance.collection("Users").where("Name" , isEqualTo: Username ).getDocuments();
  }

  getUserByUserEmail(String Email) async {
    return await Firestore.instance.collection("Users").where("Email" , isEqualTo: Email ).getDocuments();
  }

  uploadUserInfo(userMap){
    Firestore.instance.collection("Users").add(userMap).catchError((e){
      print(e.toString());
    });
  }
  
  createChatroom(String ID, chatRoomMap){
    Firestore.instance.collection("ChatRoom").document(ID)
        .setData(chatRoomMap).catchError((e){
          print(e.toString());
    });
  }
}