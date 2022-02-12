import 'dart:developer';

import 'package:flutter/cupertino.dart';

class CreateAccountProvider with ChangeNotifier {
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  bool _isLoading = false;
  bool _showError = false;

  String _errorMessage = "";

  bool get isObscurePassword => _isObscurePassword;
  set isObscurePassword(bool showPassword) {
    this._isObscurePassword = showPassword;
    log("isObscurePassword: " + showPassword.toString());
    notifyListeners();
  }

  bool get isObscureConfirmPassword => this._isObscureConfirmPassword;
  set isObscureConfirmPassword(bool value) {
    this._isObscureConfirmPassword = value;
    log("isObscureConfirmPassword: " + isObscureConfirmPassword.toString());
    notifyListeners();
  }

  bool get isLoading => this._isLoading;
  set isLoading(bool value) {
    this._isLoading = value;
    log("isLoading: " + isLoading.toString());
    notifyListeners();
  }

  bool get showError => this._showError;
  set showError(bool value) {
    this._showError = value;
    log("showError: " + showError.toString());
    notifyListeners();
  }

  String get errorMessage => this._errorMessage;
  set errorMessage(String value) {
    this._errorMessage = value;
    log("errorMessage: " + errorMessage.toString());
    notifyListeners();
  }
}
