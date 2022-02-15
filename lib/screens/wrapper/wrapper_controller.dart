import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_team_app/screens/login/login/login_screen.dart';
import 'package:my_team_app/services/firebase/firestore/auth_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/home.dart';

class WrapperController {
  Future<bool> isAlreadyLogin(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? _email = pref.getString("email");
    String? _password = pref.getString("password");

    if (_email == null || _password == null) {
      goToLoginScreen(context);
      return false;
    }

    User? user = await AuthUser().login(_email, _password, context);
    if (user != null) {
      goToHome(context);
      return true;
    } else {
      goToLoginScreen(context);
      return false;
    }
  }

  void goToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
        (route) => false);
  }

  void goToLoginScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        ),
        (route) => false);
  }
}

class HomePage {}
