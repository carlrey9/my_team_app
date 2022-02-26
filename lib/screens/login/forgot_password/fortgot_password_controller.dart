import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_team_app/services/firebase/auth/auth_user.dart';
import 'package:my_team_app/util/widgets/alert_dialog_opts.dart';

import '../../../generated/l10n.dart';

class ForgotPasswordConroller {
  late BuildContext context;
  Future<void> sendEmail(
    String text,
    BuildContext context,
  ) async {
    this.context = context;
    bool _emailSended = await AuthUser().sendEmailChangePassword(text, context);
    if (_emailSended) {
      _dialogCheckEmail(context);
    }
  }

  void _dialogCheckEmail(BuildContext context) {
    alertDialogOpts(
        context: context,
        tittle: S.of(context).verifyEmailToContinue,
        dismissible: false,
        tapPositive: _tapPositive,
        txtBtnPositive: "OK");
  }

  _tapPositive() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }
}
