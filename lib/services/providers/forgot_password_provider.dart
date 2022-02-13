import 'package:flutter/cupertino.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool _showError = false;
  String _errorMesage = "";

  bool get showError => this._showError;
  set showError(bool value) {
    this._showError = value;
    notifyListeners();
  }

  String get errorMesage => this._errorMesage;
  set errorMesage(String value) {
    this._errorMesage = value;
    notifyListeners();
  }
}
