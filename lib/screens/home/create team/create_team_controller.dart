import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_team_app/models/team_vo.dart';

import '../../../generated/l10n.dart';
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

  Future tapSaveTeam(
    BuildContext context,
    TeamVo teamVo,
  ) async {
    print(teamVo);
  }
}
