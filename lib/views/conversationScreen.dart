import 'package:chatflutterapp/Services/database.dart';
import 'package:chatflutterapp/helper/constants.dart';
import 'package:chatflutterapp/widgets/widget.dart';
import 'package:flutter/material.dart';

class conversationScreen extends StatefulWidget {
  final String ChatroomID;
  conversationScreen(this.ChatroomID);

  @override
  _conversationScreenState createState() => _conversationScreenState();
}

class _conversationScreenState extends State<conversationScreen> {
  DatabaseMethods DatabaseMethod = new DatabaseMethods();
  TextEditingController MessageCon = new TextEditingController();
  Stream chatMessageStream;

  Widget ChatMessageList() {
    return StreamBuilder(
      stream: chatMessageStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                      snapshot.data.documents[index].data["Messages"],
                      snapshot.data.documents[index].data["SendBy"] ==
                          Constants.myName);
                })
            : Container();
      },
    );
  }

  SendMessage() {
    if (MessageCon.text.isNotEmpty) {
      Map<String, dynamic> MessageMap = {
        "Messages": MessageCon.text,
        "SendBy": Constants.myName,
        "Time": DateTime.now().millisecondsSinceEpoch,
      };
      DatabaseMethod.addConvMessages(widget.ChatroomID, MessageMap);
      MessageCon.text = "";
    }
  }

  @override
  void initState() {
    DatabaseMethod.getConvMessages(widget.ChatroomID).then((value) {
      setState(() {
        chatMessageStream = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        child: Stack(
          children: [
            ChatMessageList(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Color(0xff464B53),
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 14),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: MessageCon,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: "Message ...",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          SendMessage();
                        },
                        child: Image.asset(
                          "assets/images/send.png",
                          height: 40,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String Message;
  bool isSendByMe;
  MessageTile(this.Message, this.isSendByMe);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          right: isSendByMe ? 20 : 0, left: isSendByMe ? 0 : 20),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width,
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
            color: isSendByMe ? Color(0xff464B53) : Color(0xffB9789F),
            borderRadius: isSendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomLeft: Radius.circular(23),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomRight: Radius.circular(23),
                  )),
        child: Text(Message,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            )),
      ),
    );
  }
}
