import 'package:chatflutterapp/widgets/widget.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -100,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min ,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
              ),
              SizedBox(
                height: 70,
              ),
              TextField(
                decoration: textFieldInput("email"),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                decoration: textFieldInput("password"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Text(
                    "Forget Password?",
                    style: simpleText(),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 18,),
                decoration: BoxDecoration(
                  color: Color(0xffB9789F),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Text("Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 18,),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffB9789F),),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Text("Sign In with Google",
                  style: TextStyle(
                    color: Color(0xffB9789F),
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account ?",style: medimText(), ),
                  Text("Sign up for free",style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff464B53),
                    decoration: TextDecoration.underline,
                  ),),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
