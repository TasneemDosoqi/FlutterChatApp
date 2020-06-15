import 'package:shared_preferences/shared_preferences.dart';

class helperFunction {

  static String UserLoggedInKey = "ISLOGGEDIN";
  static String UsernameKey = "USERNAMEKEY";
  static String UserEmail = "USEREMAIL";

  static Future <bool> saveUserLoggedIn(bool isUserLoggedIn) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(UserLoggedInKey, isUserLoggedIn);
  }
  static Future <bool> saveUsername(String username) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(UsernameKey, username);

  }

  static Future <bool> saveUserEmail(String email) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(UserEmail, email);

  }

  static Future <bool> getUserLoggedIn() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(UserLoggedInKey);
  }

  static Future <String> getUsername() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(UsernameKey);
  }

  static Future <String> getUserEmail() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(UserEmail);
  }


}