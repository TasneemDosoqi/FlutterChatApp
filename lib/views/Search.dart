import 'package:flutter/material.dart';
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,

        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              width: 400,
              decoration: BoxDecoration(
                  color: Color(0xff464B53),
                  borderRadius: BorderRadius.circular(40)
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
              child: Row (
                children: [
                  Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: "Search username...",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          border: InputBorder.none,

                        ),
                      ),
                  ),
                  Container(

                      child: Image.asset("assets/images/search_icon.png", height: 25,)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
