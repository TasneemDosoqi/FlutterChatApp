import 'package:chatflutterapp/helper/authenticate.dart';
import 'package:chatflutterapp/views/chatRoomScreen.dart';
import 'package:chatflutterapp/views/signin.dart';
import 'package:chatflutterapp/views/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        appBarTheme: AppBarTheme(
          color: Color(0xffB9789F),
        ),
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: authenticate() ,
    );
  }
}
