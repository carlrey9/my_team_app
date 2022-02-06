import 'package:flutter/cupertino.dart';

class ProLogin with ChangeNotifier {
  bool _isObscure = true;

  get isObscure => _isObscure;

  set isObscure(isObscure) {
    this._isObscure = isObscure;
    notifyListeners();
  }
}
