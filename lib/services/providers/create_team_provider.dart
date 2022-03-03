import 'package:flutter/cupertino.dart';

class CreateTeamProvider with ChangeNotifier {
  bool _isSaving = false;

  bool get isSaving => this._isSaving;

  set isSaving(bool value) {
    this._isSaving = value;
    notifyListeners();
  }
}
