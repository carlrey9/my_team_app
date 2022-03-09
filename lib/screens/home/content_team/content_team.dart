import 'package:flutter/material.dart';
import 'package:my_team_app/models/team_vo.dart';
import 'package:my_team_app/util/widgets/app_barr_all.dart';

class ContentTeam extends StatelessWidget {
  final TeamVo teamVo;
  const ContentTeam({Key? key, required this.teamVo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
          child: Center(
        child: Text(teamVo.name + ":  " + teamVo.categorie),
      )),
    );
  }
}
