import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_team_app/models/team_vo.dart';
import 'package:my_team_app/services/providers/create_team_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../generated/l10n.dart';
import '../../../services/firebase/firestore/crud_team.dart';
import '../../../services/providers/user_provider.dart';
import '../../../util/widgets/alert_dialog_opts.dart';

class CreateTeamController {
  late BuildContext _context;
  void onTapHelpName(BuildContext context) {
    _context = context;
    alertDialogOpts(
      context: context,
      dismissible: true,
      tittle: S.of(context).name,
      subTittle: S.of(context).helpNameTeam,
      txtBtnPositive: "OK",
      tapPositive: _tapPop,
    );
  }

  void onTapHelpCategorie(BuildContext context) {
    _context = context;
    alertDialogOpts(
      context: context,
      dismissible: true,
      tittle: S.of(context).categorie,
      subTittle: S.of(context).helpCategorieTeam,
      txtBtnPositive: "OK",
      tapPositive: _tapPop,
    );
  }

  _tapPop() {
    Navigator.of(_context).pop();
  }

  Future<bool> tapSaveTeam(
    BuildContext context,
    TeamVo teamVo,
  ) async {
    try {
      _activeIsSaving(context);
      teamVo = await _fillTeamVo(teamVo);
      bool resp = await CrudTeam().addTeam(teamVo);
      _inActiveIsSaving(context, resp);
      return true;
    } catch (e) {
      log("❌ CreateTeamController/tapSaveTeam : $e");
      return false;
    }
  }

  validateName(
    String? name,
    BuildContext context,
  ) {
    if (name!.isEmpty) {
      return S.of(context).requiredField;
    } else {
      return null;
    }
  }

  validateCategory(
    String? name,
    BuildContext context,
  ) {
    if (name!.isEmpty) {
      return S.of(context).requiredField;
    } else {
      return null;
    }
  }

  Future<TeamVo> _fillTeamVo(TeamVo teamVo) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(teamVo);
    teamVo.creator = pref.getString('id') ?? "";
    return teamVo;
  }

  void _activeIsSaving(BuildContext context) {
    final _proCreateTeam =
        Provider.of<CreateTeamProvider>(context, listen: false);
    _proCreateTeam.isSaving = true;
  }

  void _inActiveIsSaving(
    BuildContext context,
    bool resp,
  ) {
    final _proCreateTeam =
        Provider.of<CreateTeamProvider>(context, listen: false);
    _proCreateTeam.isSaving = false;
  }
}
