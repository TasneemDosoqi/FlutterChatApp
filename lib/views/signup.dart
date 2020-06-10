import 'package:chatflutterapp/widgets/widget.dart';
import 'package:flutter/material.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController userNameText = new TextEditingController();
  TextEditingController emailText = new TextEditingController();
  TextEditingController passwordText = new TextEditingController();

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
                controller: userNameText ,
                decoration: textFieldInput("username"),
              ),
              SizedBox(
                height: 8,
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
                child: Text("Sign Up",
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
                child: Text("Sign Up with Google",
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
                  Text("Already have account ?",style: medimText(), ),
                  Text("SignIn now",style: TextStyle(
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
