import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_team_app/screens/home/create%20team/create_team_screen.dart';

class HomeController {
  void tapCreateTeam(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreateTeamScreen()));
  }
}
