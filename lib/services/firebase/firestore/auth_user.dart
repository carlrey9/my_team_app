import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_team_app/models/user_vo.dart';
import 'package:my_team_app/services/providers/pro_login.dart';
import 'package:provider/provider.dart';

import '../../providers/create_account_provider.dart';

class AuthUser {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential authResult = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = authResult.user;
      log("✅ login exitoso");
      return user;
    } on FirebaseAuthException catch (e) {
      log("❌ Error in login/CrudUser: " + e.message.toString());
      final _loginProvider = Provider.of<LoginProvider>(context, listen: false);
      _loginProvider.errorMesasge = e.message.toString();
      _loginProvider.showError = true;
    }
  }

  Future<User?> registerUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    final _myProvider =
        Provider.of<CreateAccountProvider>(context, listen: false);
    try {
      UserCredential authResult =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = authResult.user;
      log("✅ user created");
      _emailVerification(user);
      return user;
    } on FirebaseAuthException catch (e) {
      log("❌ error in AuthUser/registerUser: " + e.message.toString());
      _myProvider.errorMessage = e.message.toString();
      _myProvider.showError = true;
    }
  }

  void _emailVerification(User? user) async {
    await user!.sendEmailVerification();
  }

  Future<void> sendEmailChangePassword(String text) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: text);
    } on FirebaseAuthException catch (e) {
      log("❌ Error in AuthUser/sendEmailChangePassword: " +
          e.message.toString());
    }
  }
}
