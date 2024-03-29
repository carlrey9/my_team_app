import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_team_app/models/team_vo.dart';
import 'package:my_team_app/screens/home/content_team/content_team.dart';
import 'package:my_team_app/screens/home/create%20team/create_team_screen.dart';
import 'package:my_team_app/services/firebase/firestore/crud_team.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController {
  void tapCreateTeam(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreateTeamScreen()));
  }

  Future<List<TeamVo>> getMyTeams() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<TeamVo> listTeams =
        await CrudTeam().getTeamsByIdCreator(pref.getString("id") ?? "");
    return listTeams;
  }

  void goToContentTeam(context, TeamVo teamVO) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ContentTeam(teamVo: teamVO)));
  }
}
