class Note {
  int? id;
  String contenu;
  int userId; // lié à l'utilisateur connecté

  //Constructeur principal(avec id optionnel)
  Note({
    this.id, 
    required this.contenu, 
    required this.userId,
    });

    //convertion en Map pour SQLite
    Map<String, dynamic> toMap(){
      Map<String, dynamic> map ={
        'contenu' : contenu,
        'userId' : userId,
      };
      if (id != null){
        map['id'] = id;
      }
      return map;
    }

    //reconstruction de l'objet note depuis SQLite
    factory Note.fromMap(Map<String, dynamic> map){
      return Note(
        id: map['id'],
        contenu: map['contenu'],
        userId: map['userId'],
      );
    }
}