import 'package:flutter/src/widgets/framework.dart';
import 'package:my_team_app/generated/l10n.dart';
import 'package:my_team_app/services/firebase/firestore/crud_user.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../services/providers/pro_login.dart';

class LoginController {
  late ProLogin _proLogin;
  validateFieldEmail(
    String value,
    BuildContext context,
  ) {
    if (value.isEmpty) {
      return S.of(context).requiredField;
    } else {
      return null;
    }
  }

  Future<void> loginCorreo(
    BuildContext context,
    UserProvider userProvider,
  ) async {
    _proLogin = Provider.of<ProLogin>(context, listen: false);
    _proLogin.isCharging = true;
    await CrudUser().login(userProvider.email, userProvider.password);
    _proLogin.isCharging = false;
  }

  validateFieldPassword(
    String value,
    BuildContext context,
  ) {
    if (value.isEmpty) {
      return S.of(context).requiredField;
    } else {
      return null;
    }
  }
}
