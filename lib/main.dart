import 'package:chatflutterapp/helper/authenticate.dart';
import 'package:chatflutterapp/helper/helperFunctions.dart';
import 'package:chatflutterapp/views/chatRoomScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await helperFunction.getUserLoggedIn().then((value){
      setState(() {
        userIsLoggedIn  = value;
      });
    });
  }


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
      home: userIsLoggedIn != null ?  userIsLoggedIn ? ChatRoom() : authenticate()
          : Container(
        child: Center(
          child: authenticate(),
        ),
      ),
    );
  }
}
