<<<<<<< HEAD
# gestion_notes
I. 
CAHIER DE CHARGE DU PROJET 
1. Introduction 
Ce document a pour but de définir les spécifications et les exigences nécessaires 
pour le développement d’une application mobile. L’application vise à aider les 
utilisateurs à mieux enregistrer leurs notes. De façon générale, l’application 
permettra à l’utilisateur de s’authentifier, d’enregistrer les différentes notes, de 
les consultées, de modifier ou supprimer des enregistrements de notes. Elle 
offrira ainsi un outil pratique pour assurer une prise de note. 
2. Objectif du projet 
L’application a pour objectif de fournir à l’utilisateur un espace personnel 
simple et sécurisé pour gérer efficacement ses notes. 
Elle lui permettra de créer, consulter, modifier et supprimer ses notes, tout en 
assurant leur conservation sur son appareil.  
L’application vise donc à résoudre le problème de gestion et d’organisation des 
notes personnelles 
3. Portée du projet 
La première version de l’application a pour objectif de proposer les 
fonctionnalités essentielles permettant à un utilisateur de prendre efficacement 
ses notes. Elle sera conçue pour être simple d’utilisation et adaptée aux besoins 
quotidiens. 
 Fonctionnalités incluses dans la version initiale : 
 Ecran d’Authentification (Login) : 
o Saisie du nom de l’utilisateur et du mot de passe ; 
o Validation des champs et affichage de message d’erreur explicites en cas 
d’échec ; 
o Redirection sécurisée vers l’écran principal après validation. 
 Création de comptes utilisateurs : permettre à plusieurs utilisateurs de 
créer leur propre compte et de gérer leurs notes personnelles ; 
 Ecran principal (Liste des notes et saisie) : 
o Saisie rapide : champ d’ajout de note 
o Affichage structuré de la liste des notes enregistrées ; 
 Modification des notes 
o Bouton d’édition : icone crayon pour chaque ligne pour déclencher la 
modification. 
o Fenêtre modale : pop-up d’édition pré-remplie avec l’ancien texte. 
o Bouton de contrôle : actions annuler pour fermer et enregistrer pour 
mettre à jour ; 
 Suppression 
o Suppression rapide : icone corbeille sur chaque ligne pour retirer 
immédiatement la note. 
 Base de Données locale 
o Stockage SQLite : sauvegarde, lecture, modification et suppression 
(CRUD) persistantes en local. 
 Fonctionnalités envisagées pour les versions futures  
Les versions futures pourront intégrer des fonctionnalités supplémentaires 
afin d’améliorer l’expérience utilisateur, notamment : 
 Synchronisation en ligne : permettre la sauvegarde et la synchronisation 
des notes sur un serveur ou dans un cloud. 
 Recherche de notes : permettre à l’utilisateur de retrouver rapidement une 
note grâce à des mots-clés ; 
 Ajout d’images et de pièces jointes : permettre d’ajouter des photos, 
documents ou autre fichiers aux notes 
 Catégorisations des notes : organiser les notes par catégories ; 
 Rappels et notification : permettre à l’utilisateur  de programmer des 
rappels pour certaines notes ou tâches. 
4. Exigences fonctionnelles 
L’application doit offrir un ensemble de fonctionnalités essentielles permettant à 
l’utilisateur de gérer ses notes de manière simple et efficace. 
 Authentification et sécurité : permettre à l’utilisateur de saisir son nom 
d’utilisateur et son mot de passe, de vérifier les informations de connexion 
et donner un accès à l’application après une authentification réussie ; 
 Inscription : permettre à l’utilisateur de s’inscrire pour avoir un compte 
utilisateur  
 Consultation des notes : afficher la liste des notes enregistrées; 
 Création d’une note : permettre à l’ »utilisateur de créer une nouvelle 
note ; 
 Modification d’une note : permettre à l’utilisateur de modifier une note 
existante, enregistrer les modifications effectuées; 
 Suppression d’une note : permettre à l’utilisateur de supprimer une note, 
demander une confirmation avant la suppression afin d’éviter une 
suppression accidentelle, actualisation automatique de la liste après 
suppression ; 
 Gestion des données : stocker les notes dans une base de données  SQLite 
locale, créer localement la base de données et la table des notes au 
premier démarrage de l’application. 
5. Exigence non fonctionnelles 
Les exigences non fonctionnelles définissent les critères de qualité et de 
performance que l’application doit respecter afin d’assurer une bonne 
expérience utilisateur  
 Simplicité d’utilisation : l’application doit être facile à utiliser, avec une 
interface intuitive permettant à tout utilisateur, même débutant, de naviguer 
sans difficulté.  
 Performance : l’application doit être rapide dans l’exécution des actions  
 Fiabilité : les données enregistrées doivent être correctement sauvegardées 
et ne pas être perdues lors de l’utilisation normale de l’application  
 Sécurité : l’accès à l’application doit être protégé par un système de 
connexion afin d’éviter l’accès non autorisé aux données personnelles.  
 Compatibilité : l’application doit fonctionner correctement sur n’importe 
quel type d’écran 
 Facilité de maintenance : l’application doit être conçue de manière simple 
afin de permettre facilement des mises à jour ou des améliorations futures. 
6. Interface utilisateur et expérience utilisateur 
L’interface utilisateur de l’application de gestion des notes  doit être conçue de 
manière simple, claire et accessible afin de garantir une bonne expérience 
utilisateur. 
 Design et organisation visuelle : 
 Disposition claire (Layout) : alignement verticale propre du formulaire de 
connexion et de la liste de notes pour une lecture naturelle de haut en bas. 
 Typographie adaptée : polices et tailles de texte distinctes pour 
différencier facilement les titres  des tailles de la note ; 
 Palette de couleurs : utilisation d’un thème bleu principal cohérent offrant 
un contraste élevé avec le fond blanc. 
 Interactivité et Feedback utilisateur :  
 Micro-interactions : Boutons d’action clairs pour valider ou interrompre 
une action sans ambiguïté ; 
 Message de retour (Feedback) : Notification visuelle explicite à l’écran en 
cas d’erreur ; 
 Fluidité d’affichage : Rafraîchissement instantané des éléments à l’écran 
après chaque ajout, modification ou suppression. 
 Navigation : la navigation entre les différentes pages doit être fluide et 
intuitive. L’utilisateur doit pouvoir accéder facilement aux principales 
fonctionnalités telles que l’ajout, la consultation et la modification des 
dépenses. Un menu principal clair doit permettre de passer d’un écran à 
un autre sans difficulté.  
 Expérience utilisateur (UX) : l’application doit offrir une expérience 
simple et agréable. Les actions doivent être rapides et compréhensibles 
sans besoin de formation particulière. L’objectif est de réduire au 
maximum les étapes nécessaires pour effectuer une tâche.  
7. Flux de navigation 
Le flux de navigation décrit la manière dont l’utilisateur interagit avec 
l’application et la façon dont il passe d’un écran à un autre pour utiliser les 
différentes fonctionnalités. 
Ecran 1 : Mes Notes, Ecran de connexion  
 Accès à l’application : l’utilisateur commence par l’écran de connexion. Il 
doit entrer son nom et son mot de passe s’il est déjà inscrit et cliquer sur « 
Enregistrer », après authentification réussie, il est redirigé vers l’écran 
d’accueil qui représente le point central de navigation ; dans le cas où il 
n’est pas encore inscrit il doit cliquer sur le bouton « Créer un compte » 
ou il enregistrera son nom et son mot de passe. 
Ecran 2 : To do list, Ecran Principal (liste et création) 
Il permet à l’utilisateur de : 
 Consultation : l’utilisateur visualise la liste complète des notes stockées en 
local ; 
 Ajout de note : l’utilisateur saisie un texte directement dans le champs en 
haut de l’écran ; 
Flux de modification (boite de dialogue) : 
Après le clique sur l’icône crayon, une fenêtre modale (Dialog) s’ouvre déjà pré
remplie avec le contenu actuel de la note ; l’utilisateur met à jour la note et 
clique sur enregistrer, il peut aussi cliquer sur annuler s’il ne veut plus modifier. 
Flux de suppression : 
L’utilisateur clique sur l’icône corbeille de note, une fenêtre modale s’affiche 
pour la confirmation de la suppression. 
8. Modélisation des données : Diagramme de classe 
Description des classes : 
 Utilisateur : Représente la personne inscrite dans l’application  
 Note : représente une note créée  
II. 
GUIDE D’INSTALLATION ET CONFIGURATION 
1. Prérequis système 
ou supérieur) 
 Flutter SDK( Version  sFlutter 3.47.0        
 Dart SDK 
 Android Studio / VS Code avec extensions Flutter et Dart 
 Emulateur   Android 
2. Etape d’installation 
 Cloner /Extraire le projet : avec la commande,   « cd 
 Récupérer les dépendances :    « flutter pub get » 
 Nettoyer le cache : « flutter clean » 
 Lancer l’application :     « flutter run » 
III. 
GUIDE D’UTILISATION DE L’APPLICATION 
1. Ecran de connexion : 
 Saisir le nom d’utilisateur et le mot de passe ; 
 Cliquer sur connexion ; 
 Cliquer sur le lien d’inscription si le compte n’existe. 
2. Ecran d’inscription 
 Remplir les champs du formulaire (nom et mot de passe) ; 
 Validation des données et enregistrement dans la base de données. 
3. Gestion des notes : 
 Ajouter : Saisir le texte dans les champs supérieur « Ajouter une note et 
appuyer sur l’icône + ; 
 Modifier : appuyer sur l’icône crayon sur la liste de la note, ajuste le texte 
dans la fenêtre surgissant, puis cliquer sur enregistre ; 
 Supprimer : appuyer sur l’icône poubelle pour retirer la note. 
 Déconnexion : appuyer sur la flèche retour dans la barre supérieure pour 
revenir à l’écran de connexion. 
IV. ARCHITECTURE ET CHOIX DE CONCEPTION 
1. Structure du code (lib) : 
Explication de l’organisation des répertoires (Pattern MVC léger) : 
 Modele/ : Contient les classes de données utilisateur et note (avec 
méthode toMap et formMap pour SQLite) ; 
 Services/  :  DatabaseManager gérant la création de la base de données 
SQLite, l’ouverture de la connexion et les requêtes SQL (CRUD) ; 
 Views / : Contient les interfaces utilisateurs (ConnexionInterface, 
InscriptionInterface, NotesInterface) 
 Main.dart : Point d’entrée, configuration du thème global Material3 et des 
routes de l’application. 
2. Choix techniques justifiés 
 Material 3 : choisir pour garantir un design moderne, cohérent et adapter 
automatiquement les palettes de couleur ; 
 Base de données SQLite (sqflite) : retenue pour assurer la persistance des 
données directement sur l’appareil sans dépendre d’une connexion 
internet ; 
 Navigation sécurisée (Navigator.pushReplacement) : utilisation de 
remplacement de page lors de la connexion/ déconnexion afin d’empêcher 
tout retour non autorisé à l’écran à l’écran précédent via le bouton 
physique du téléphone ; 
 Contrôleurs distincts (_ajoutController et _editingController) ; séparation 
des instances pour éviter les effets  de bord entre la zone de saisie et la 
boite de dialogue d’édition.
A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
# Gestion-des-notes
c'est un petit projet pour une application de gestion de notes pour le compte de fin de formation intermédiaire en développement d'application mobile organisé par l'OIF, cette application permettra a l'utilisateur de d'enregistrer ses différentes notes, il doit d'abord s'inscrire avant de le faire .  
>>>>>>> 16c0ea2d5255dc4921b7cbbfe9b068cdfdff728a
