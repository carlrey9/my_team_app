import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_team_app/models/user_vo.dart';
import 'package:my_team_app/services/firebase/firestore/auth_user.dart';
import 'package:my_team_app/services/providers/create_account_provider.dart';
import 'package:my_team_app/util/widgets/alert_dialog_opts.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';

class CreateAccountController {
  late BuildContext context;
  validatorName(String? name, BuildContext context) {
    if (name!.isEmpty) {
      return S.of(context).requiredField;
    } else {
      return null;
    }
  }

  validatorLastname(String? lastname, BuildContext context) {
    if (lastname!.isEmpty) {
      return S.of(context).requiredField;
    } else {
      return null;
    }
  }

  validatorEmail(String? email, BuildContext context) {
    if (email!.isEmpty) {
      return S.of(context).requiredField;
    }
    if (!email.contains("@") || !email.contains(".")) {
      return S.of(context).invalidformat;
    }

    return null;
  }

  validatorPassword(
    String? password,
    BuildContext context,
  ) {
    if (password!.isEmpty) {
      return S.of(context).requiredField;
    }

    if (password.length < 5) {
      return S.of(context).write6Characters;
    }
    return null;
  }

  validatorConfirmPassword(
    String? confirmPassword,
    BuildContext context,
    String password,
  ) {
    if (confirmPassword!.isEmpty) {
      return S.of(context).requiredField;
    }
    if (confirmPassword != password) {
      return S.of(context).differentPassword;
    }
    return null;
  }

  Future<void> createAccount(
    BuildContext context,
    UserVO userVO,
  ) async {
    this.context = context;
    final _myProvider =
        Provider.of<CreateAccountProvider>(context, listen: false);
    _myProvider.isLoading = true;
    _myProvider.showError = false;

    await _registerUser(userVO, context);

    _myProvider.isLoading = false;
  }

  Future<void> _registerUser(
    UserVO userVO,
    BuildContext context,
  ) async {
    User? user =
        await AuthUser().registerUser(userVO.email, userVO.password, context);
    if (user != null) {
      _showAlertVerifyEmail(context);
    }
  }

  void _showAlertVerifyEmail(BuildContext context) {
    alertDialogOpts(
        context: context,
        tittle: S.of(context).verifyEmail,
        tapPositive: _tapPositive,
        txtBtnPositive: "OK",
        subTittle: S.of(context).verifyYourEmail,
        dismissible: false);
  }

  _tapPositive() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }
}
