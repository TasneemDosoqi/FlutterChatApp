import 'package:chatflutterapp/views/signin.dart';
import 'package:chatflutterapp/views/signup.dart';
import 'package:flutter/material.dart';

class authenticate extends StatefulWidget {
  @override
  _authenticateState createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {
  bool ShowSignIn = true;
  void toggleView() {
    setState(() {
      ShowSignIn = !ShowSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ShowSignIn) {
      return Signin(toggleView);
    } else {
      return SignUp(toggleView);
    }
  }
}
