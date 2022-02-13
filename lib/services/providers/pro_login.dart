import 'dart:developer';

import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  bool _isObscure = true;
  var _keyForm;
  bool _isCharging = false;
  bool _showError = false;
  String _errorMesasge = "";

  bool get isObscure => _isObscure;
  set isObscure(bool isObscure) {
    this._isObscure = isObscure;
    notifyListeners();
  }

  get keyForm => _keyForm;
  set keyForm(keyForm) {
    this._keyForm = keyForm;
    notifyListeners();
  }

  bool get isCharging => _isCharging;
  set isCharging(bool isCharging) {
    this._isCharging = isCharging;
    notifyListeners();
  }

  bool get showError => _showError;
  set showError(bool showError) {
    this._showError = showError;
    notifyListeners();
  }

  String get errorMesasge => _errorMesasge;
  set errorMesasge(String errorMesasge) {
    this._errorMesasge = errorMesasge;
    notifyListeners();
  }
}
