import 'package:flutter/material.dart';
import 'package:my_team_app/screens/login/forgot_password/fortgot_password_controller.dart';
import 'package:my_team_app/services/providers/forgot_password_provider.dart';
import 'package:my_team_app/util/widgets/app_barr_all.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../util/my_colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late double _height;
  late double _width;
  late ForgotPasswordProvider _passwordProvider;
  bool _isLoading = false;
  TextEditingController _emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    _defVariables();
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _tittle(),
                _filedEmail(),
                _errorMesage(),
                _btnPassword(),
              ],
            ),
          )),
      appBar: appBarAllTittle(Text(S.of(context).forgotMyPassword)),
    );
  }

  Widget _tittle() {
    return Container(
      child: Text(S.of(context).infoForgotPassword),
    );
  }

  Widget _filedEmail() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(12),
            borderSide: new BorderSide(),
          ),
          label: Text(S.of(context).email),
        ),
      ),
    );
  }

  Widget _btnPassword() {
    return Container(
      child: MaterialButton(
        onPressed: () {
          _clickPassword();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: MyColors.acentColor,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          height: _height / 12,
          width: _width / 3,
          child: FittedBox(
            child: _isLoading
                ? Container(
                    padding: EdgeInsets.all(5),
                    child: CircularProgressIndicator(
                      color: MyColors.textIcons,
                    ))
                : Text(
                    S.of(context).forgotMyPassword,
                    style: TextStyle(
                      color: MyColors.textIcons,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void _clickPassword() async {
    if (_emailController.text.isNotEmpty) {
      await ForgotPasswordConroller().sendEmail(_emailController.text, context);
    }
  }

  void _defVariables() {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _passwordProvider = Provider.of<ForgotPasswordProvider>(context);
  }

  Widget _errorMesage() {
    return _passwordProvider.showError
        ? Container(
            child: Stack(
              children: [
                _wErrorMesagge(),
                _wIconCancelErrorMesasage(),
              ],
            ),
          )
        : SizedBox();
  }

  Widget _wIconCancelErrorMesasage() {
    return Positioned(
      right: 0,
      top: 20,
      child: InkWell(
          onTap: () {
            _passwordProvider.showError = false;
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
        _passwordProvider.errorMesage,
        style: TextStyle(),
      ),
    );
  }
}
