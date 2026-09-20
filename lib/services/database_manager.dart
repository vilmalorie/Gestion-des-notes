import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../modele/note.dart';
import '../modele/utilisateur.dart';

class DatabaseManager {
  static Database? _database;//variable privée et statique qui converse l'instance unique de la base ouvert

  //Getter pour récupérer l'instance de la base de données
  Future<Database> get database async{
    if(_database != null) return _database !;
    _database = await _initDatabase();
    return _database!;
  }

  //Initialisation de la base SQLite
  Future<Database> _initDatabase() async{
    String path = join(await getDatabasesPath(), 'note_database.db');//nom du fichier de la base de donnée

    return await openDatabase( //ouvre la base de données avec la version spécifiée
      path,
      version: 1,
      onCreate: (db, version) async{

        //Création de la première table, utilisateur
        await db.execute('''
         CREATE TABLE utilisateurs(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nom TEXT,
          password TEXT
          
          )
        ''');

        //création de la deuxième table: notes
        await db.execute('''
          CREATE TABLE notes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            contenu TEXT,
            userId INTEGER,
            FOREIGN KEY (userId) REFERENCES utilisateurs (id)
            )
          ''');
      }
    );
  }


  //InsertUtilisateur
  Future<int> insertUtilisateur(Utilisateur utilisateur) async {
    final db = await database;
    return await db.insert(
      'utilisateurs',
      utilisateur.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
      );
  }

//Connexion utilisateur
  Future<Utilisateur?> connecterUtilisateur(String nom, String password) async{
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'utilisateurs',
      where: 'nom = ? AND password = ?',
      whereArgs: [nom, password],
    );

    if(maps.isNotEmpty){
      return
      Utilisateur.fromMap(maps.first);
    }
    return null; //connexion échouée
  }

  //insertNote
  Future<int> insertNote(Note note) async{
    final db = await database;
    return await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //recupération des notes des user connectés avec getNotesByUserId
  Future<List<Note>> getNoteByUserId(int userId) async{
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'notes',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return List.generate(maps.length, (i){
      return Note.fromMap(maps[i]);
    });

  }

  //modification d'une note avec updateNote
    Future<int> updateNote(Note note) async{
      final db = await database;
      return await db.update(
        'notes',
        note.toMap(),
        where: 'id = ?',
        whereArgs: [note.id],
      );
    }

  //Suppression d'une note avec deleteNote
  //modification d'une note avec updateNote
    Future<int> deleteNote(int id) async{
      final db = await database;
      return await db.delete(
        'notes',
        where: 'id = ?',
        whereArgs: [id],
        
      );
    }


}