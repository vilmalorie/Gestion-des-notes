import 'package:flutter/material.dart';
import '../modele/utilisateur.dart';
import '../services/database_manager.dart';

class InscriptionInterface extends StatefulWidget {
  const InscriptionInterface({super.key});

  @override
  State<InscriptionInterface> createState() => _InscriptionInterfaceState();
}

class _InscriptionInterfaceState extends State<InscriptionInterface> {
  final DatabaseManager _dbManager = DatabaseManager();

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose(){
    _nomController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Méthode pour gérer l'inscription 
  Future<void> _inscrire() async{
    String nom = _nomController.text.trim();
    String password = _passwordController.text.trim();

    if(nom.isNotEmpty && password.isNotEmpty){
      // Création de l'objet utilisateur
      Utilisateur nouvelUtilisateur = Utilisateur(
        nom: nom,
        password: password,
      );
      // Insertion des informations dans la base de données
      await _dbManager.insertUtilisateur(nouvelUtilisateur);

      if(!mounted) return;

      // Message de confirmation
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Compte créé avec succès !")
        ),
      );
      // Redirection vers la page de connexion
      Navigator.pushReplacementNamed(context, '/');
    } else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Veuillez remplir tous les champs")
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Inscription", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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

            // Champ nom d'utilisateur
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(
                labelText: "Nom d'utilisateur",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Champ mot de passe
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Mot de passe",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // Bouton d'inscription
            SizedBox(
              width: 140,
              child: ElevatedButton(
                onPressed: _inscrire,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                child: const Text("S'inscrire"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}