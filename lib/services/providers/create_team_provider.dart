import 'package:flutter/cupertino.dart';

class CreateTeamProvider with ChangeNotifier {
  bool _saving = false;

  bool get saving => this._saving;

  set saving(bool value) {
    this._saving = value;
    notifyListeners();
  }
}
