import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_team_app/generated/l10n.dart';
import 'package:my_team_app/screens/home/home.dart';
import 'package:my_team_app/screens/login/forgot_password/forgot_password.dart';
import 'package:my_team_app/services/firebase/firestore/auth_user.dart';
import 'package:provider/provider.dart';

import '../../../services/providers/user_provider.dart';
import '../../../services/providers/pro_login.dart';

class LoginController {
  late LoginProvider _proLogin;
  validateFieldEmail(
    String value,
    BuildContext context,
  ) {
    if (value.isEmpty) {
      return S.of(context).requiredField;
    } else {
      return null;
    }
  }

  Future<void> loginCorreo(
    BuildContext context,
    UserProvider userProvider,
  ) async {
    _proLogin = Provider.of<LoginProvider>(context, listen: false);
    _proLogin.isCharging = true;
    User? user = await AuthUser().login(
      userProvider.email,
      userProvider.password,
      context,
    );
    if (user != null) {
      if (user.emailVerified) {
        _goToHome(context);
      } else {
        log("❌ sin confirmar email");
        _proLogin.errorMesasge = S.of(context).verifyYourEmail;
        _proLogin.showError = true;
      }
    }

    _proLogin.isCharging = false;
    return;
  }

  validateFieldPassword(
    String value,
    BuildContext context,
  ) {
    if (value.isEmpty) {
      return S.of(context).requiredField;
    } else {
      return null;
    }
  }

  void _goToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
        (route) => false);
  }

  void goToForgotPassword(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
  }
}
