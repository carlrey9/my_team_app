import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_team_app/screens/home/home_controller.dart';
import 'package:my_team_app/util/my_colors.dart';
import '../../generated/l10n.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).teams),
        backgroundColor: MyColors.primaryColor,
      ),
      body: _body(),
      floatingActionButton: _button(),
    );
  }

  Center _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "No hay equipos",
              style: TextStyle(
                color: MyColors.secundaryText,
              ),
            ),
          ),
          Lottie.network(
              "https://assets7.lottiefiles.com/packages/lf20_ocGoFt.json"),
        ],
      ),
    );
  }

  Widget _button() {
    return FloatingActionButton.extended(
      isExtended: true,
      backgroundColor: MyColors.acentColor,
      elevation: 10,
      onPressed: () {
        HomeController().tapCreateTeam(context);
      },
      label: Text(
        S.of(context).createTeam,
        style: (TextStyle(fontSize: 16)),
        maxLines: 1,
      ),
    );
  }
}
