import 'package:flutter/material.dart';
import 'package:my_team_app/screens/login/login/login_screen.dart';
import 'package:my_team_app/screens/wrapper/wrapper_controller.dart';

import '../../util/widgets/global_loading.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool login = false;
  @override
  void initState() {
    super.initState();
    _getLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: GlobalLoading(),
        ),
      ),
    );
  }

  void _getLogin() async {
    login = await WrapperController().isAlreadyLogin(context);
    if (login) {
      WrapperController().goToHome(context);
    } else {
      WrapperController().goToLoginScreen(context);
    }
  }
}
