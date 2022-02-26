import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_team_app/models/user_vo.dart';
import 'package:my_team_app/screens/login/create_account/create_account_controller.dart';
import 'package:my_team_app/services/providers/create_account_provider.dart';
import 'package:my_team_app/util/my_colors.dart';
import 'package:my_team_app/util/widgets/square.dart';
import 'package:my_team_app/util/widgets/title_login.dart';
import 'package:provider/provider.dart';

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
  final _formkey = GlobalKey<FormState>();
  UserVO _userVO = new UserVO();
  late CreateAccountProvider _myProvider;
  TextEditingController _fieldPasswordController = TextEditingController();

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
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      _tittle(),
                      _hintInformation(S.of(context).hintInfoCreateAccount),
                      _fieldName(),
                      _fieldLastname(),
                      _fieldEmail(),
                      _fieldPassword(),
                      _fieldPasswordConfirm(),
                      _messageError(),
                      _btnCreateAccount(),
                    ],
                  ),
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
    _myProvider = Provider.of<CreateAccountProvider>(context);
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
        validator: (value) {
          return CreateAccountController().validatorName(value, context);
        },
        onSaved: (value) {
          _userVO.name = value ?? "";
        },
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
        validator: (value) {
          return CreateAccountController().validatorLastname(value, context);
        },
        onSaved: (value) {
          _userVO.lastname = value ?? "";
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(12),
            borderSide: new BorderSide(),
          ),
          label: Text(S.of(context).lastname),
        ),
      ),
    );
  }

  _fieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        validator: (value) {
          return CreateAccountController().validatorEmail(value, context);
        },
        onSaved: (value) {
          _userVO.email = value ?? "";
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(12),
            borderSide: new BorderSide(),
          ),
          label: Text(S.of(context).email),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  _fieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        obscureText: _myProvider.isObscurePassword,
        controller: _fieldPasswordController,
        validator: (value) {
          return CreateAccountController().validatorPassword(value, context);
        },
        onSaved: (value) {
          _userVO.password = value ?? "";
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          suffixIcon: InkWell(
              onTap: () {
                _myProvider.isObscurePassword = !_myProvider.isObscurePassword;
              },
              child: Icon(Icons.remove_red_eye)),
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

  Widget _fieldPasswordConfirm() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        obscureText: _myProvider.isObscureConfirmPassword,
        validator: (value) {
          return CreateAccountController().validatorConfirmPassword(
              value, context, _fieldPasswordController.text);
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          suffixIcon: InkWell(
              onTap: () {
                _myProvider.isObscureConfirmPassword =
                    !_myProvider.isObscureConfirmPassword;
              },
              child: Icon(Icons.remove_red_eye)),
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(12),
            borderSide: new BorderSide(),
          ),
          label: Text(S.of(context).confirmPassword),
        ),
      ),
    );
  }

  Widget _messageError() {
    return Visibility(
      visible: _myProvider.showError,
      child: Stack(
        children: [
          _wErrorMesagge(),
          _wIconCancelErrorMesasage(),
        ],
      ),
    );
  }

  Widget _wIconCancelErrorMesasage() {
    return Positioned(
      right: 0,
      top: 20,
      child: InkWell(
          onTap: () {
            _myProvider.showError = false;
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
        _myProvider.errorMessage,
        style: TextStyle(),
      ),
    );
  }

  _btnCreateAccount() {
    return Container(
      margin: EdgeInsets.all(20),
      child: MaterialButton(
        onPressed: () async {
          if (_formkey.currentState!.validate()) {
            _formkey.currentState!.save();
            await CreateAccountController().createAccount(
              context,
              _userVO,
            );
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: MyColors.acentColor,
        child: Container(
          height: _height / 12,
          width: _width / 3,
          child: FittedBox(
            child: _myProvider.isLoading
                ? Container(
                    padding: EdgeInsets.all(10),
                    child: CircularProgressIndicator(
                      color: MyColors.textIcons,
                    ))
                : Text(
                    S.of(context).creatteAccount,
                    style: TextStyle(
                        color: MyColors.textIcons, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}
