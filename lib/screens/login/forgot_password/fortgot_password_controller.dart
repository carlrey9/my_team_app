import 'package:my_team_app/services/firebase/firestore/auth_user.dart';

class ForgotPasswordConroller {
  Future<void> sendEmail(String text) async {
    await AuthUser().sendEmailChangePassword(text);
  }
}
