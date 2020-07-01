import 'package:chatflutterapp/Services/Authentication.dart';
import 'package:chatflutterapp/Services/database.dart';
import 'package:chatflutterapp/helper/authenticate.dart';
import 'package:chatflutterapp/helper/constants.dart';
import 'package:chatflutterapp/helper/helperFunctions.dart';
import 'package:chatflutterapp/views/Search.dart';
import 'package:chatflutterapp/views/conversationScreen.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  Auth auth = new Auth();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  Stream chatroomStream;
  @override
  Widget chatroomLis() {
    return StreamBuilder(
      stream: chatroomStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return chatroomsTile(
                      snapshot.data.documents[index].data["chatroomID"]
                          .toString()
                          .replaceAll("_", "")
                          .replaceAll(Constants.myName, ""),
                      snapshot.data.documents[index].data["chatroomID"]);
                })
            : Container();
      },
    );
  }

  void initState() {
    getUserInfo();

    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await helperFunction.getUsername();
    databaseMethods.getChatrooms(Constants.myName).then((value) {
      setState(() {
        chatroomStream = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //titleSpacing: -100,
        leading: Transform.translate(
          offset: Offset(15, 0),
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
        title: Text("Tasneem Chat App"), centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              auth.SignOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => authenticate(),
                  ));
            },
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.exit_to_app, size: 35)),
          )
        ],
      ),
      body: chatroomLis(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Search()));
        },
      ),
    );
  }
}

class chatroomsTile extends StatelessWidget {
  final String userName;
  final String chatroom;
  chatroomsTile(this.userName, this.chatroom);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => conversationScreen(chatroom)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xffB9789F),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Text(
                "${userName.substring(0, 1).toUpperCase()}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              userName,
              style: TextStyle(
                color: Color(0xffB9789F),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
