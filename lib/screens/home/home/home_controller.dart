import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_team_app/screens/home/create%20team/create_team_screen.dart';
import 'package:my_team_app/services/firebase/firestore/crud_team.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController {
  void tapCreateTeam(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreateTeamScreen()));
  }

  Future<void> getMyTeams() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    CrudTeam().getTeamsByIdCreator(pref.getString("id") ?? "");
  }
}
