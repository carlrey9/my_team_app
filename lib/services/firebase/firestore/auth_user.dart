import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_team_app/models/user_vo.dart';
import 'package:provider/provider.dart';

import '../../providers/create_account_provider.dart';

class AuthUser {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> login(
    String email,
    String password,
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
      return user;
    } on FirebaseAuthException catch (e) {
      log("❌ error in AuthUser/registerUser: " + e.message.toString());
      _myProvider.errorMessage = e.message.toString();
      _myProvider.showError = true;
    }
  }
}
