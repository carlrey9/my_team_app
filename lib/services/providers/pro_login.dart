import 'dart:developer';

import 'package:flutter/cupertino.dart';

class ProLogin with ChangeNotifier {
  bool _isObscure = true;
  var _keyForm;
  bool _isCharging = false;

  bool get isObscure => _isObscure;

  set isObscure(bool isObscure) {
    this._isObscure = isObscure;
    log("isObscure = " + isObscure.toString());
    notifyListeners();
  }

  get keyForm => _keyForm;

  set keyForm(keyForm) {
    this._keyForm = keyForm;
    log("keyForm = " + keyForm.toString());
    notifyListeners();
  }

  bool get isCharging => _isCharging;

  set isCharging(bool isCharging) {
    this._isCharging = isCharging;
    log("isCharging = " + isCharging.toString());
    notifyListeners();
  }
}
