import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_team_app/util/my_colors.dart';
import 'package:my_team_app/util/widgets/square.dart';
import 'package:my_team_app/util/widgets/title_login.dart';

import '../../../generated/l10n.dart';
import '../../../util/widgets/app_barr_all.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  double _width = 0.0;
  double _height = 0.0;

  @override
  Widget build(BuildContext context) {
    _defVariables();
    return Scaffold(
      appBar: appBarAllTittle(Text(S.of(context).creatteAccount)),
      body: Stack(
        children: [
          _square(),
          Center(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _tittle(),
                    _hintInformation(
                        "Completa toda la información y presiona crear cuenta para crear tu nueva cuenta "),
                    _fieldName(),
                    _fieldLastname(),
                    _fieldEmail(),
                    _fieldPassword(),
                    _fieldPasswordConfirm(),
                    _messageError("errorr"),
                    _btnCreateAccount(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _square() {
    return Positioned(
      left: _width / 3 * 2,
      top: -_width / 3 * 2,
      child: Roulette(
          animate: true,
          spins: 1,
          duration: Duration(seconds: 350),
          child: Square(
            color: MyColors.acentColor,
          )),
    );
  }

  void _defVariables() {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
  }

  _tittle() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: TittleLogin(
        text: S.of(context).creatteAccount,
        color: MyColors.primaryColor,
      ),
    );
  }

  _hintInformation(String info) {
    return Visibility(
      visible: true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(
          horizontal: _width / 6,
          vertical: 20,
        ),
        child: Center(
          child: Text(
            info,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MyColors.secundaryText,
            ),
          ),
        ),
      ),
    );
  }

  _fieldName() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(12),
            borderSide: new BorderSide(),
          ),
          label: Text(S.of(context).name),
        ),
      ),
    );
  }

  _fieldLastname() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(12),
            borderSide: new BorderSide(),
          ),
          label: Text(S.of(context).name),
        ),
      ),
    );
  }

  _fieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
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

  _fieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          suffixIcon: Icon(Icons.remove_red_eye),
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(12),
            borderSide: new BorderSide(),
          ),
          label: Text(S.of(context).password),
        ),
      ),
    );
  }

  _messageError(String info) {
    return Visibility(
      visible: false,
      child: Container(
        color: Colors.red,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(
          horizontal: _width / 6,
          vertical: 20,
        ),
        child: Text(info),
      ),
    );
  }

  _btnCreateAccount() {
    return Container(
      margin: EdgeInsets.all(20),
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: MyColors.acentColor,
        child: Container(
          height: _height / 12,
          width: _width / 3,
          child: FittedBox(
            /* child: _proLogin.isCharging
                ? Container(
                    padding: EdgeInsets.all(10),
                    child: CircularProgressIndicator(
                      color: MyColors.textIcons,
                    ))
                : Text(
                    S.of(context).login,
                    style: TextStyle(
                        color: MyColors.textIcons, fontWeight: FontWeight.bold),
                  ), */

            child: Text(
              S.of(context).creatteAccount,
              style: TextStyle(
                  color: MyColors.textIcons, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  _fieldPasswordConfirm() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          suffixIcon: Icon(Icons.remove_red_eye),
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(12),
            borderSide: new BorderSide(),
          ),
          label: Text(S.of(context).password),
        ),
      ),
    );
  }
}
