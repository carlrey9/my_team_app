import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_team_app/services/providers/pro_login.dart';
import 'package:my_team_app/util/widgets/title_login.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProLogin(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'VarelaRound'),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
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
}
