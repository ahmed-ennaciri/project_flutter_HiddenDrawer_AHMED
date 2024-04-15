import 'package:project_flutter/models/projets_model.dart'; // Importe le modèle de projet
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Projets.db"; // Nom de la base de données pour les projets

  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async => await db.execute(
        "CREATE TABLE Projet(id INTEGER PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL);"), // Crée la table pour les projets
      version: _version,
    );
  }

  static Future<int> addProjet(Projet projet) async { // Ajoute un projet à la base de données
    final db = await _getDB();
    return await db.insert(
      "Projet", // Nom de la table pour les projets
      projet.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> updateProjet(Projet projet) async { // Met à jour un projet dans la base de données
    final db = await _getDB();
    return await db.update(
      "Projet", // Nom de la table pour les projets
      projet.toJson(),
      where: 'id = ?',
      whereArgs: [projet.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> deleteProjet(Projet projet) async { // Supprime un projet de la base de données
    final db = await _getDB();
    return await db.delete(
      "Projet", // Nom de la table pour les projets
      where: 'id = ?',
      whereArgs: [projet.id],
    );
  }

  static Future<List<Projet>?> getAllProjets() async { // Récupère tous les projets depuis la base de données
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Projet"); // Nom de la table pour les projets

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Projet.fromJson(maps[index])); // Convertit les données en objets Projet
  }
}
