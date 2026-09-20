import 'package:flutter/material.dart';
import '../modele/utilisateur.dart';
import '../services/database_manager.dart';
import '../views/notes_view.dart';
import '../views/inscription_view.dart';

// Création de la classe ConnexionInterface qui étend StatefulWidget
class ConnexionInterface extends StatefulWidget {
  const ConnexionInterface({super.key});

  @override
  State<ConnexionInterface> createState() => ConnexionInterfaceState();
}

class ConnexionInterfaceState extends State<ConnexionInterface> {
  final DatabaseManager _dbManager = DatabaseManager();

  // Déclarer des TextEditingController pour les champs nom et mot de passe
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Clé globale pour gérer la validation du formulaire (nom corrigé)
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nomController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Méthode pour gérer la connexion
  void _seConnecter() async {
    if (_formKey.currentState!.validate()) {
      String nom = _nomController.text.trim();
      String password = _passwordController.text.trim();

      // Appel de la méthode dans DatabaseManager
      Utilisateur? user = await _dbManager.connecterUtilisateur(nom, password);

      // Sécurité Flutter après un await
      if (!mounted) return;

      if (user != null) {
        // Connexion réussie : affichage du message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Bienvenue ${user.nom} !")),
        );
        // TODO: Naviguer vers l'écran des notes (ex: NotesView)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotesInterface(utilisateur: user),
          ),
        );
      } else {
        // Échec de la connexion
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Nom d'utilisateur ou mot de passe incorrect"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Mes Notes', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 0, //utiliser pour l'ombre
      ),
      body: SingleChildScrollView(    //'SingleChildScrollView': permet au contenu de défiler si la taille de l'écran est trop petite pour tout afficher
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), //permet de définir les marges internes de manière symétrique autour d'un widget. "EdgeInsets" la classe qui gère les espacements en pixes dans flutter ".symmetric(...): indique que les valeurs appliquées seront identiques pour les côtés opposés(gauche/droit et haut/bas) " "horizontal: 24.0, vertical: 16.0": ajoute un espace de 24pixel à gauche et à droite et ajoute un espace de 16 pixel à gauche et à droite
        child: Form(
          key: _formKey, // Association de la clé au Form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,// aligne tous les éléments au centre horizontalement
            children: [
              const SizedBox(height: 10),

              // Image d'en-tête arrondie
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'assets/images/note.jpg',
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 140,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Champ Nom d'utilisateur
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(
                  labelText: "Nom d'utilisateur",
                  isDense: true,
                ),
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Champ requis' : null,
              ),
              const SizedBox(height: 20),

              // Champ Mot de passe
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  isDense: true,
                ),
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Champ requis' : null,
              ),
              const SizedBox(height: 30),

              // Bouton de connexion
              SizedBox(
                width: 140,
                child: ElevatedButton(
                  onPressed: _seConnecter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                  child: const Text('Connexion'),
                ),
              ),
              const SizedBox(height: 16),

              // Lien vers l'inscription (placé au niveau de la Column)
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  InscriptionInterface(),
                    ),
                  );
                },
                child: const Text("Vous n'avez pas de compte ? S'inscrire"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}