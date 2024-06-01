class UserModel {
  String? matricula;
  String? name;
  String? email;
  String? telephone;

  UserModel({this.matricula, this.name, this.email, this.telephone});

  Map<String, dynamic> toFirestore() {
    return {
      if (matricula != null) "matricula": matricula,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (telephone != null) "telephone": telephone
    };
  }
}
