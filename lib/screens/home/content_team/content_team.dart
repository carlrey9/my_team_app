import 'package:flutter/material.dart';
import 'package:my_team_app/models/team_vo.dart';
import 'package:my_team_app/util/widgets/app_barr_all.dart';

import '../../../util/widgets/pastilla.dart';

class ContentTeam extends StatelessWidget {
  final TeamVo teamVo;
  const ContentTeam({Key? key, required this.teamVo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          this.teamVo.name,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Container(
          child: Center(
        child: ContainerServices(),
      )),
    );
  }
}

class ContainerServices extends StatelessWidget {
  const ContainerServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Pastilla(
                title: "Estudiantes",
                onClick: () {},
                color: Colors.blue,
                icon: Icon(
                  Icons.people,
                  color: Colors.blue,
                  size: 40,
                )),
            Pastilla(
                title: "Clases",
                onClick: () {},
                color: Colors.amber,
                icon: Icon(
                  Icons.book_sharp,
                  color: Colors.amber,
                  size: 40,
                )),
            Pastilla(
              title: "Proximamente",
              onClick: () {},
              color: Colors.black,
              icon: Icon(
                Icons.question_mark_rounded,
                color: Colors.black,
                size: 40,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
