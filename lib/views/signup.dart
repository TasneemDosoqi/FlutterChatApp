import 'package:chatflutterapp/Services/Authentication.dart';
import 'package:chatflutterapp/Services/database.dart';
import 'package:chatflutterapp/helper/helperFunctions.dart';
import 'package:chatflutterapp/widgets/widget.dart';
import 'package:flutter/material.dart';

import 'chatRoomScreen.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  final FormKey = GlobalKey<FormState>();
  Auth auth = new Auth();

  TextEditingController userNameText = new TextEditingController();
  TextEditingController emailText = new TextEditingController();
  TextEditingController passwordText = new TextEditingController();


  DatabaseMethods databaseMethods = new DatabaseMethods();

  SignInUser() {
    if (FormKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      auth.SignUpEandP(emailText.text, passwordText.text).then((val) {
        Map<String, String> userInfoMap = {
          "Name": userNameText.text,
          "Email": emailText.text
        };

        helperFunction.saveUsername(userNameText.text);
        helperFunction.saveUserEmail(emailText.text);

        databaseMethods.uploadUserInfo(userInfoMap);
        helperFunction.saveUserLoggedIn(true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatRoom()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 100,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Form(
                      key: FormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val) {
                              return val.isEmpty || val.length < 2
                                  ? "Please provide valid username"
                                  : null;
                            },
                            controller: userNameText,
                            decoration: textFieldInput("username"),
                          ),
                          SizedBox(
                            height: 1,
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
                            height: 1,
                          ),
                          TextFormField(
                            obscureText: true,
                            validator: (val) {
                              return val.length > 6
                                  ? null
                                  : "Please provide password +6 character";
                            },
                            controller: passwordText,
                            decoration: textFieldInput("password"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        SignInUser();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffB9789F),
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "Sign Up",
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
                      padding: EdgeInsets.symmetric(
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffB9789F),
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "Sign Up with Google",
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
                        Text(
                          "Already have account ?",
                          style: medimText(),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.toggle();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "SignIn now",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff464B53),
                                decoration: TextDecoration.underline,
                              ),
                            ),
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
