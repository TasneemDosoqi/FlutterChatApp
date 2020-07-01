import 'package:chatflutterapp/widgets/widget.dart';
import 'package:flutter/material.dart';

class conversationScreen extends StatefulWidget {
  @override
  _conversationScreenState createState() => _conversationScreenState();
}

class _conversationScreenState extends State<conversationScreen> {

  Widget ChatMessageList(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Color(0xff464B53),
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 14),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
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
                              },
                              child: Image.asset(
                                "assets/images/send.png", height: 40,)
                          ),
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

