import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:my_team_app/models/team_vo.dart';
import 'package:my_team_app/models/user_vo.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class CrudTeam {
  CollectionReference teams = firestore.collection("teams");

  Future<bool> addTeam(
    TeamVo teamVo,
    UserVO userVO,
  ) async {
    try {
      final docRef = teams.doc();
      teamVo.id = docRef.id;
      await docRef.set(teamVo.toMap());
      await docRef.collection("admins").doc(userVO.id).set(userVO.toMapAdmin());
      await docRef.collection("athletes").doc().set({"name": "", "docRef": ""});

      log("🆗 CrudTeam/addTeam ");
      return true;
    } catch (e) {
      log("❌ addUser/addTeam : $e");
      return false;
    }
  }

  Future<List<TeamVo>> getTeamsByIdCreator(String idUser) async {
    List<TeamVo> teamsList = [];
    try {
      TeamVo teamVo = new TeamVo();
      await teams
          .where('creator'.trim(), isEqualTo: idUser)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          var map = element.data();

          teamsList.add(teamVo.mapToTeamVo({}));
        });
      });

      // await admins.get().then((value) => {print("")});
      await teams.doc(idUser).collection("admins").get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          print("elemet:" + element.data().toString());
        });
      });
      ;

      return teamsList;
    } catch (e) {
      log("❌ Error in CrudTeam/getTeamsByIdCreator: $e");
      return teamsList;
    }
  }
}
