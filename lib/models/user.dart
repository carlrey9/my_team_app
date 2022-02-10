import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  String _name = "";
  String _id = "";
  String _email = "";
  String _password = "";

/*   UserProvider(this.name, this.id, this.email, this.password); */

  /* get getName => this.name;
  set setName(String name) => this.name = name;

  get getId => this.id;
  set setId(String id) => this.id = id;

  get getEmail => this.email;
  set setEmail(String email) => this.email = email;

  get getPassword => this.password;
  set setPassword(String password) => this.password = password; */

  String get name => this._name;
  set name(String name) {
    this._name = name;
    notifyListeners();
  }

  String get id => this._id;
  set id(String id) {
    this._id = id;
    notifyListeners();
  }

  String get email => this._email;
  set email(String email) {
    this._email = email;
    notifyListeners();
  }

  String get password => this._password;
  set password(String password) {
    this._password = password;
    notifyListeners();
  }
}
