import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_team_app/generated/l10n.dart';
import 'package:my_team_app/services/providers/user_provider.dart';
import 'package:my_team_app/screens/login/create_account/create_account.dart';
import 'package:my_team_app/screens/login/login/login_controller.dart';
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
  late LoginProvider _loginProvider;
  bool _isfirtsIn = true;

  @override
  Widget build(BuildContext context) {
    _defVariables();

    return Scaffold(
      body: Stack(
        children: [
          SquareLocal(),
          Center(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: _isfirtsIn
                    ? FutureBuilder(
                        future: _verifyPreLogin(context),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return _loading();
                          } else {
                            _isfirtsIn = false;
                            return _body();
                          }
                        },
                      )
                    : _body()),
          ),
        ],
      ),
    );
  }

  Center _loading() {
    return Center(
      child: CircularProgressIndicator(color: MyColors.primaryColor),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _tittle(),
            _subtittle(),
            _errorMesage(),
            _fieldEmail(),
            _fieldPassword(),
            _btnForgotMyPassword(),
            _btnLogin(),
            _btnCreateAccount(),
          ],
        ),
      ),
    );
  }

  SizedBox _errorMesage() {
    return SizedBox(
        child: _loginProvider.showError
            ? Stack(
                children: [
                  _wErrorMesagge(),
                  _wIconCancelErrorMesasage(),
                ],
              )
            : Container(height: _height / 5));
  }

  Widget _wIconCancelErrorMesasage() {
    return Positioned(
      right: 0,
      top: 20,
      child: InkWell(
          onTap: () {
            _loginProvider.showError = false;
          },
          child: Icon(
            Icons.cancel_rounded,
            color: MyColors.secundaryText,
          )),
    );
  }

  Container _wErrorMesagge() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[200],
        borderRadius: BorderRadius.circular(12),
      ),
      width: _width / 3 * 2,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Text(
        _loginProvider.errorMesasge,
        style: TextStyle(),
      ),
    );
  }

  Widget _tittle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: TittleLogin(
          text: S.of(context).welcomeMyTeamApp, color: MyColors.acentColor),
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
        obscureText: _loginProvider.isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          suffixIcon: InkWell(
              onTap: () {
                _loginProvider.isObscure = !_loginProvider.isObscure;
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
      onPressed: () {
        _clickForgotMyPassword();
      },
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
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: _height / 12,
        width: _width / 3,
        child: FittedBox(
          child: _loginProvider.isCharging
              ? Container(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator(
                    color: MyColors.textIcons,
                  ))
              : Text(
                  S.of(context).login,
                  style: TextStyle(
                    color: MyColors.textIcons,
                  ),
                ),
        ),
      ),
    );
  }

  void _clickLogin() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _loginProvider.showError = false;
      await LoginController().loginCorreo(
        context,
        _userProvider,
      );
    }
  }

  Widget _btnCreateAccount() {
    return TextButton(
      onPressed: () {
        _clickCreateAccount();
      },
      child: Text(S.of(context).creatteAccount),
    );
  }

  void _defVariables() {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _userProvider = Provider.of<UserProvider>(context);
    _loginProvider = Provider.of<LoginProvider>(context);
  }

  void _clickCreateAccount() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreateAccountScreen()));
  }

  void _clickForgotMyPassword() {
    LoginController().goToForgotPassword(context);
  }

  _verifyPreLogin(BuildContext context) async {
    await LoginController().verifyPreLogin(context);
    if (_userProvider.email.isNotEmpty && _userProvider.password.isNotEmpty) {
      await LoginController().loginCorreoPreLogin(
          context, _userProvider.email, _userProvider.password);
    }
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
          child: Square(
            color: MyColors.primaryColor,
          )),
    );
  }
}
