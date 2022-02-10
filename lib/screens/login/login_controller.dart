import 'package:flutter/src/widgets/framework.dart';
import 'package:my_team_app/generated/l10n.dart';
import 'package:my_team_app/services/firebase/firestore/crud_user.dart';

class LoginController {
  String validateFieldEmail(String? value, BuildContext context) {
    if (value != null) {
      if (value.isEmpty) {
        return S.of(context).requiredField;
      } else {
        return "";
      }
    } else {
      return "";
    }
  }

  void loginCorreo(String email, String password) async {
    await CrudUser().login(email, password);
  }
}
