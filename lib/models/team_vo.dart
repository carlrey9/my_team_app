class TeamVo {
  String id = "";
  String name = "";
  String color = "";
  String categorie = "";
  List athletes = [];
  List admins = [];
  String creator = "";

  String get getId => this.id;

  set setId(String id) => this.id = id;

  get getName => this.name;

  set setName(name) => this.name = name;

  get getColor => this.color;

  set setColor(color) => this.color = color;

  get getCategorie => this.categorie;

  set setCategorie(categorie) => this.categorie = categorie;

  get getAthletes => this.athletes;

  set setAthletes(athletes) => this.athletes = athletes;

  get getAdmins => this.admins;

  set setAdmins(admins) => this.admins = admins;

  get getCreator => this.creator;

  set setCreator(creator) => this.creator = creator;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    map.addAll({
      "id": this.id,
      "name": this.name,
      "color": this.color,
      "categorie": this.categorie,
      "athletes": this.athletes,
      "admins": this.admins,
      "creator": this.creator,
    });
    return map;
  }
}
