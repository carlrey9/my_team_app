import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_team_app/models/team_vo.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class CrudTeam {
  CollectionReference users = firestore.collection("teams");

  Future<bool> addTeam(
    TeamVo teamVo,
  ) async {
    try {
      final docRef = users.doc();
      teamVo.id = docRef.id;
      await docRef.set(teamVo.toMap());
      log("🆗 CrudTeam/addTeam ");
      return true;
    } catch (e) {
      log("❌ addUser/addTeam : $e");
      return false;
    }
  }
}
