import 'package:flutter/material.dart';

Widget appBar(BuildContext context){
  return AppBar(
    leading: const Padding(
      padding: EdgeInsets.all(7.0),
      child: ClipOval(
      ),
    ),
    title: Text("Tasneem Chat App" ) ,centerTitle: true,
  );
}

InputDecoration textFieldInput (String hint){
   return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(
      fontSize: 15,
      color: Color(0xff464B53),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Color(0xffB9789F),
      ),
    ),
  );
}

TextStyle simpleText () {
  return TextStyle(
    fontSize: 15,
    color: Color(0xff464B53),
  );
}
  TextStyle medimText () {
    return TextStyle(
      fontSize: 18,
      color: Color(0xff464B53),
    );
  }