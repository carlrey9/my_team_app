import 'dart:developer';

import 'package:flutter/cupertino.dart';

class ProLogin with ChangeNotifier {
  bool _isObscure = true;

  bool get isObscure => _isObscure;

  set isObscure(bool isObscure) {
    this._isObscure = isObscure;
    log("isObscure = " + isObscure.toString());
    notifyListeners();
  }
}
