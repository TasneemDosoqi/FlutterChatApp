import 'package:chatflutterapp/modul/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromBase(FirebaseUser user) {
    return user != null ? User(userId: user.uid) : null;
  }

  Future SignInEandP(String email, String passw) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: passw);

      FirebaseUser firebaseUser = result.user;

      return _userFromBase(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future SignUpEandP(String email, String paasw) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: paasw);

      FirebaseUser firebaseUser = result.user;
      return _userFromBase(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
