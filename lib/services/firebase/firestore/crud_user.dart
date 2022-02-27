import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_team_app/models/user_vo.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class CrudUser {
  CollectionReference users = firestore.collection("users");

  Future<void> addUser(
    UserVO userVO,
  ) async {
    try {
      final docRef = users.doc(userVO.id);
      await docRef.set(userVO.toMap());
      log("🆗 addUser/CrudUser ");
    } catch (e) {
      log("❌ addUser/CrudUser ");
    }
  }
}
