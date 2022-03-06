class UserVO {
  String _name = "";
  String _lastname = "";
  String _email = "";
  String _password = "";
  String _id = "";
  String _userType = "";
  String _identification = "";
  String _acudienteName = "";
  String _phoneAcudiente = "";
  String _phone = "";
  DateTime _birthDate = DateTime.now();
  DateTime _dateCreation = DateTime.now();

  List<String> _teams = [];
  List<String> _pagos = [];

  get dateCreation => this._dateCreation;

  set dateCreation(value) => this._dateCreation = value;

  String get userType => this._userType;

  set userType(String value) => this._userType = value;

  get identification => this._identification;

  set identification(value) => this._identification = value;

  get birthDate => this._birthDate;

  set birthDate(value) => this._birthDate = value;

  get acudienteName => this._acudienteName;

  set acudienteName(value) => this._acudienteName = value;

  get phoneAcudiente => this._phoneAcudiente;

  set phoneAcudiente(value) => this._phoneAcudiente = value;

  get phone => this._phone;

  set phone(value) => this._phone = value;

  get teams => this._teams;

  set teams(value) => this._teams = value;

  get pagos => this._pagos;

  set pagos(value) => this._pagos = value;

  String get name => this._name;

  set name(String value) => this._name = value;

  get lastname => this._lastname;

  set lastname(value) => this._lastname = value;

  get email => this._email;

  set email(value) => this._email = value;

  get password => this._password;

  set password(value) => this._password = value;

  get id => this._id;

  set id(value) => this._id = value;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map.addAll({
      "name": this.name,
      "lastname": this.lastname,
      "email": this.email,
      "id": this.id,
      "usertype": this.userType,
      "identification": this.identification,
      "acudiente_name": this.acudienteName,
      "phone_acudiente": this.phoneAcudiente,
      "phone": this.phone,
      "bith_date": this.birthDate.toString(),
      "teams": this.teams,
      "pagos": this.pagos,
      "date_creation": this._dateCreation.toString(),
    });
    return map;
  }

  Map<String, dynamic> toMapAdmin() {
    Map<String, dynamic> map = {};
    map.addAll({
      "name": this.name,
      "id": this.id,
    });
    return map;
  }
}
