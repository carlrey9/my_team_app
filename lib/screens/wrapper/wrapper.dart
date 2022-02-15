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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _verifyPreLogin(),
          builder: (context, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: GlobalLoading(),
              );
            } else {
              return Center(
                child: GlobalLoading(),
              );
            }
          }),
    );
  }

  Future<bool> _verifyPreLogin() async {
    return WrapperController().isAlreadyLogin(context);
  }
}
