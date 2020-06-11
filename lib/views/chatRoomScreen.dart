import 'package:chatflutterapp/Services/Authentication.dart';
import 'package:chatflutterapp/helper/authenticate.dart';
import 'package:chatflutterapp/views/Search.dart';
import 'package:chatflutterapp/views/signin.dart';
import 'package:chatflutterapp/widgets/widget.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  Auth auth = new Auth();

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
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => authenticate(),
              ));
            },
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.exit_to_app, size: 35)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child : Icon(Icons.search),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => Search()
          ));
        },
      ),
    );
  }
}
