import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_team_app/services/providers/create_account_provider.dart';
import 'package:my_team_app/services/providers/user_provider.dart';
import 'package:my_team_app/services/providers/pro_login.dart';
import 'package:my_team_app/util/my_colors.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'screens/login/login/login_screen.dart';
import 'screens/wrapper/wrapper.dart';
import 'services/providers/forgot_password_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text("Error")),
          );
        } else {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => LoginProvider()),
              ChangeNotifierProvider(create: (context) => UserProvider()),
              ChangeNotifierProvider(
                  create: (context) => CreateAccountProvider()),
              ChangeNotifierProvider(
                  create: (context) => ForgotPasswordProvider()),
            ],
            child: MaterialApp(
              theme: ThemeData(
                fontFamily: 'VarelaRound',
                primaryColor: MyColors.primaryColor,
              ),
              debugShowCheckedModeBanner: false,
              home: Wrapper(),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
            ),
          );
        }
      },
    );
  }
}
