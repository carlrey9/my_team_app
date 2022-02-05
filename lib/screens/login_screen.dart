import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_team_app/generated/l10n.dart';
import 'package:my_team_app/util/my_colors.dart';
import 'package:my_team_app/util/widgets/square.dart';
import 'package:my_team_app/util/widgets/sub_tittle_login.dart';

import 'package:my_team_app/util/widgets/title_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(children: [
        SquareLocal(),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Tittle(),
                  Subtittle(),
                  SizedBox(
                    height: _height / 5,
                  ),
                  FieldEmail(),
                  FieldPassword(),
                  BtnForgotMyPassword(),
                  BtnLogin(),
                  BtnCreateAccount(),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class Tittle extends StatelessWidget {
  const Tittle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: TittleLogin(text: S.of(context).welcomeMyTeamApp));
  }
}

class Subtittle extends StatelessWidget {
  const Subtittle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: SubTittleLogin(text: S.of(context).manageYourTeam),
    );
  }
}

class FieldEmail extends StatelessWidget {
  const FieldEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(12),
            borderSide: new BorderSide(),
          ),
          label: Text(S.of(context).userName),
        ),
      ),
    );
  }
}

class FieldPassword extends StatelessWidget {
  const FieldPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(12),
            borderSide: new BorderSide(),
          ),
          label: Text(
            S.of(context).password,
          ),
        ),
      ),
    );
  }
}

class BtnForgotMyPassword extends StatelessWidget {
  const BtnForgotMyPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(S.of(context).forgotMyPassword),
    );
  }
}

class BtnLogin extends StatelessWidget {
  const BtnLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return MaterialButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: MyColors.acentColor,
      child: Container(
        height: _height / 12,
        width: _width / 4,
        child: FittedBox(
          child: Text(
            S.of(context).login,
            style: TextStyle(
                color: MyColors.textIcons, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class BtnCreateAccount extends StatelessWidget {
  const BtnCreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(S.of(context).creatteAccount),
    );
  }
}

class SquareLocal extends StatelessWidget {
  const SquareLocal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Positioned(
      left: -_width / 2,
      top: -_width / 2,
      child: Roulette(
          animate: true,
          spins: 1,
          duration: Duration(seconds: 350),
          child: Square()),
    );
  }
}
