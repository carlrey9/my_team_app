import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_team_app/generated/l10n.dart';
import 'package:my_team_app/models/user.dart';
import 'package:my_team_app/screens/login/login_controller.dart';
import 'package:my_team_app/services/providers/pro_login.dart';
import 'package:my_team_app/util/my_colors.dart';
import 'package:my_team_app/util/widgets/square.dart';
import 'package:my_team_app/util/widgets/sub_tittle_login.dart';

import 'package:my_team_app/util/widgets/title_login.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late double _height;
  late double _width;
  late UserProvider _userProvider;
  late ProLogin _proLogin;

  @override
  Widget build(BuildContext context) {
    _defVariables();

    return Scaffold(
      body: Stack(children: [
        SquareLocal(),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _tittle(),
                    _subtittle(),
                    SizedBox(height: _height / 5),
                    _fieldEmail(),
                    _fieldPassword(),
                    _btnForgotMyPassword(),
                    _btnLogin(),
                    _btnCreateAccount(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _tittle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: TittleLogin(text: S.of(context).welcomeMyTeamApp),
    );
  }

  Widget _subtittle() {
    return Container(
      margin: EdgeInsets.all(20),
      child: SubTittleLogin(text: S.of(context).manageYourTeam),
    );
  }

  Widget _fieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: (value) {
          return LoginController().validateFieldEmail(value ?? "", context);
        },
        onSaved: (value) {
          _userProvider.email = value ?? "";
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(12),
            borderSide: new BorderSide(),
          ),
          label: Text(S.of(context).userName),
        ),
      ),
    );
  }

  Widget _fieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: (value) {
          return LoginController().validateFieldPassword(value ?? "", context);
        },
        onSaved: (value) {
          _userProvider.password = value ?? "";
        },
        obscureText: _proLogin.isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          suffixIcon: InkWell(
              onTap: () {
                _proLogin.isObscure = !_proLogin.isObscure;
              },
              child: Icon(Icons.remove_red_eye)),
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(12),
            borderSide: new BorderSide(),
          ),
          label: Text(
            S.of(context).password,
          ),
        ),
      ),
    );
  }

  Widget _btnForgotMyPassword() {
    return TextButton(
      onPressed: () {},
      child: Text(S.of(context).forgotMyPassword),
    );
  }

  Widget _btnLogin() {
    return MaterialButton(
      onPressed: () {
        _clickLogin();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: MyColors.acentColor,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: _height / 12,
        width: _width / 4,
        child: FittedBox(
          child: Text(
            S.of(context).login,
            style: TextStyle(
                color: MyColors.textIcons, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _clickLogin() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await LoginController().loginCorreo(context, _userProvider);
    }
  }

  Widget _btnCreateAccount() {
    return TextButton(
      onPressed: () {},
      child: Text(S.of(context).creatteAccount),
    );
  }

  void _defVariables() {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _userProvider = Provider.of<UserProvider>(context);
    _proLogin = Provider.of<ProLogin>(context);
  }
}

class SquareLocal extends StatelessWidget {
  const SquareLocal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Positioned(
      left: -_width / 2,
      top: -_width / 2,
      child: Roulette(
          animate: true,
          spins: 1,
          duration: Duration(seconds: 350),
          child: Square()),
    );
  }
}
