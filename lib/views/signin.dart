import 'package:chatflutterapp/Services/Authentication.dart';
import 'package:chatflutterapp/Services/database.dart';
import 'package:chatflutterapp/helper/helperFunctions.dart';
import 'package:chatflutterapp/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chatRoomScreen.dart';


class Signin extends StatefulWidget {

  final Function toggle ;
  Signin(this.toggle);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  
  final formKey = GlobalKey<FormState>();
  TextEditingController emailText = new TextEditingController();
  TextEditingController passText = new TextEditingController();
  Auth auth = new Auth();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  QuerySnapshot snapshotUserInfo;
  bool isLoading = false;
  
  void signIn() {
    if(formKey.currentState.validate()){
      helperFunction.saveUserEmail(emailText.text);
      setState(() {
        isLoading =true;
      });
    }
    databaseMethods.getUserByUserEmail(emailText.text).then((val){
      snapshotUserInfo=val;
      helperFunction.saveUsername(snapshotUserInfo.documents[0].data["Name"]);

    });

    auth.SignInEandP(emailText.text, passText.text).then((value){
      if(value != null){
        helperFunction.saveUserLoggedIn(true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatRoom()));
      }

    });
    

  }
  
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
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 70,
                    ),
                    TextFormField(
                      validator: (val) {
                        return RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                            .hasMatch(val)
                            ? null
                            : "Please provide valid email ";
                      },
                      controller: emailText,
                      decoration: textFieldInput("email"),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (val) {
                          return val.length > 6
                              ? null
                              : "Please provide password +6 character";
                        },
                      controller: passText,
                      decoration: textFieldInput("password"),
                    ),
                  ],
                ),
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
              GestureDetector(
                onTap: (){
                  signIn();
                },
                child: Container(
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
              ),
              SizedBox(
                height: 15,
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
                  GestureDetector(
                    onTap: (){
                      widget.toggle();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("Sign up for free",style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff464B53),
                        decoration: TextDecoration.underline,
                      ),),
                    ),
                  ),
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
