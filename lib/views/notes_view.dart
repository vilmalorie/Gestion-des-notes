import 'package:flutter/material.dart';
import '../modele/note.dart';
import '../modele/utilisateur.dart';
import '../services/database_manager.dart';

// Création de la classe NotesInterface qui étend de StatefulWidget
class NotesInterface extends StatefulWidget {
  final Utilisateur utilisateur;
  const NotesInterface({Key? key, required this.utilisateur}) : super(key: key);

  @override
  State<NotesInterface> createState() => _NotesInterfaceState();
}

class _NotesInterfaceState extends State<NotesInterface> {
  final DatabaseManager _dbManager = DatabaseManager();

  // Déclarer des TextEditingController pour les champs
  final TextEditingController _ajoutController = TextEditingController();
  final TextEditingController _editingController = TextEditingController();

  // Liste des notes à afficher sur l'écran
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState(); // CORRIGÉ : Ajout des parenthèses ()
    _chargerNotes(); // Charger les données dès l'ouverture de l'écran
  }

  @override
  void dispose() {
    _ajoutController.dispose();
    _editingController.dispose();
    super.dispose();
  }

  // Méthode asynchrone de chargement des notes de l'utilisateur
  Future<void> _chargerNotes() async {
    List<Note> notes = await _dbManager.getNoteByUserId(widget.utilisateur.id!);
    setState(() {
      _notes = notes;
    });
  }

  // Ajout d'une note (CORRIGÉ : _ajouterNote avec un 'r')
  Future<void> _ajouterNote() async {
    String texte = _ajoutController.text.trim();
    if (texte.isNotEmpty) {
      Note nouvelleNote = Note(
        contenu: texte,
        userId: widget.utilisateur.id!,
      );
      await _dbManager.insertNote(nouvelleNote);
      _ajoutController.clear();
      _chargerNotes();
    }
  }

  // Afficher la pop-up d'édition
  void _afficherDialogueEdition(Note note) {
    
    _editingController.text = note.contenu;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Modifier la note"),
          content: TextField(
            controller: _editingController, // CORRIGÉ
            decoration: const InputDecoration(
              hintText: "Entrer la nouvelle note",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Annuler"),
            ),
            TextButton(
              onPressed: () async {
                String nouveauTexte = _editingController.text.trim(); // CORRIGÉ
                if (nouveauTexte.isNotEmpty) { // CORRIGÉ : faute de frappe corrigée
                  note.contenu = nouveauTexte;
                  await _dbManager.updateNote(note);
                  if (!mounted) return;
                  Navigator.pop(context);
                  _chargerNotes();
                }
              },
              child: const Text("Enregistrer"),
            ),
          ],
        );
      },
    );
  }

  // Supprimer une note
  void _supprimerNote(int idNote) async {
    await _dbManager.deleteNote(idNote);
    _chargerNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To do list",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ),
      body: Column(
        children: [
          // Zone d'ajout supérieure
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _ajoutController,
                    decoration: const InputDecoration(
                      hintText: "Ajouter une note",
                      isDense: true,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.blue),
                  onPressed: _ajouterNote, // CORRIGÉ
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Liste des notes avec boutons modifier et supprimer
          Expanded(
            child: _notes.isEmpty
                ? const Center(child: Text("Aucune note enregistrée"))
                : ListView.builder(
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      final note = _notes[index];
                      return ListTile(
                        title: Text(note.contenu), // CORRIGÉ : note.contenu au lieu de note.titre
                        trailing: Row( // CORRIGÉ : trailing au lieu de trailling
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Icône modifier
                            IconButton( // CORRIGÉ : Ajout du widget IconButton
                              icon: const Icon(Icons.edit, color: Colors.grey), // CORRIGÉ : color
                              onPressed: () => _afficherDialogueEdition(note),
                            ),
                            // Icône supprimer
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.grey),
                              onPressed: () => _supprimerNote(note.id!),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}