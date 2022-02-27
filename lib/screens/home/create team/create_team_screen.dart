import 'package:flutter/material.dart';
import 'package:my_team_app/screens/home/create%20team/create_team_controller.dart';
import 'package:my_team_app/util/widgets/sub_tittle_login.dart';

import '../../../generated/l10n.dart';
import '../../../util/my_colors.dart';

class CreateTeamScreen extends StatefulWidget {
  CreateTeamScreen({Key? key}) : super(key: key);

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: _body(),
      floatingActionButton: _saveButton(),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      title: Text(S.of(context).createTeam),
      backgroundColor: MyColors.primaryColor,
    );
  }

  Center _body() {
    return Center(
      child: Column(
        children: [
          /* _textTittle(), */
          _fieldName(),
          _fieldCategoria(),
        ],
      ),
    );
  }

  Widget _textTittle() {
    return SubTittleLogin(text: S.of(context).fillinfo);
  }

  Widget _fieldName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.people),
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(12),
            borderSide: new BorderSide(),
          ),
          label: Text(S.of(context).name),
          suffixIcon: _iconHelpName(),
        ),
      ),
    );
  }

  Widget _iconHelpName() {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: () {
        CreateTeamController().onTapHelpName(context);
      },
      child: Icon(Icons.help_outline_rounded),
    );
  }

  Widget _fieldCategoria() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.category),
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(12),
              borderSide: new BorderSide(),
            ),
            label: Text(S.of(context).categorie),
            suffixIcon: _iconHelpCategorie()),
      ),
    );
  }

  Widget _iconHelpCategorie() {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: () {
        CreateTeamController().onTapHelpCategorie(context);
      },
      child: Icon(Icons.help_outline_rounded),
    );
  }

  Widget _saveButton() {
    return FloatingActionButton.extended(
      isExtended: true,
      backgroundColor: MyColors.acentColor,
      elevation: 10,
      onPressed: () {
        CreateTeamController().onTapSaveButton(context);
      },
      label: Text(
        S.of(context).saveTeam,
        style: (TextStyle(fontSize: 16)),
        maxLines: 1,
      ),
    );
  }
}
