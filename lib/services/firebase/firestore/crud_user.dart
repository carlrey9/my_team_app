import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CrudUser {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future login(
    String email,
    String password,
  ) async {
    try {
      UserCredential authResult = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = authResult.user;
      log("login exitoso");
      return user;
    } on SocketException {
    } catch (e) {
      log("Error in login/CrudUser: " + e.toString());
    }
  }
}
