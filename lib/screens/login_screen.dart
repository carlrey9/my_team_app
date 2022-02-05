import 'package:flutter/material.dart';
import 'package:my_team_app/generated/l10n.dart';
import 'package:my_team_app/util/widgets/sub_tittle_login.dart';
import 'package:my_team_app/util/widgets/text_form_field_login.dart';
import 'package:my_team_app/util/widgets/title_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Tittle(),
              Subtittle(),
              FieldEmail(),
              FieldPassword(),
            ],
          ),
        ),
      ),
    );
  }
}

class Tittle extends StatelessWidget {
  const Tittle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: TittleLogin(text: S.of(context).welcomeMyTeamApp));
  }
}

class Subtittle extends StatelessWidget {
  const Subtittle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SubTittleLogin(text: S.of(context).manageYourTeam),
    );
  }
}

class FieldEmail extends StatelessWidget {
  const FieldEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          color: Colors.blue[100],
          borderRadius: new BorderRadius.all(new Radius.circular(20))),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(20),
            borderSide: new BorderSide(),
          ),
          label: Text("name"),
        ),
      ),
    );
  }
}

class FieldPassword extends StatelessWidget {
  const FieldPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
