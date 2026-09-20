class Utilisateur{
  int? id;
  String nom;
  String password;

  Utilisateur({
    this.id,
    required this.nom,
    required this.password,
  });

  //convertion en map pour SQL
  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      'nom' : nom,
      'password' : password,
    };
    if (id!=null){
      map['id'] = id;
    }
    return map;
  }

//reconstruction de l'objet utilisateur depuis SQLite
factory Utilisateur.fromMap(Map<String, dynamic> map){
  return Utilisateur(
    id: map['id'],
    nom: map['nom'],
    password: map['password'],
  );
}

}