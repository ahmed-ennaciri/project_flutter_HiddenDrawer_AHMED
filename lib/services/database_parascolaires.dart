import 'package:project_flutter/models/parascolaires_model.dart'; // Importe le modèle de parascolaire
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Parascolaires.db"; // Nom de la base de données pour les parascolaires

  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async => await db.execute(
        "CREATE TABLE Parascolaire(id INTEGER PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL);"), // Crée la table pour les parascolaires
      version: _version,
    );
  }

  static Future<int> addParascolaire(Parascolaire parascolaire) async { // Ajoute un parascolaire à la base de données
    final db = await _getDB();
    return await db.insert(
      "Parascolaire", // Nom de la table pour les parascolaires
      parascolaire.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> updateParascolaire(Parascolaire parascolaire) async { // Met à jour un parascolaire dans la base de données
    final db = await _getDB();
    return await db.update(
      "Parascolaire", // Nom de la table pour les parascolaires
      parascolaire.toJson(),
      where: 'id = ?',
      whereArgs: [parascolaire.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> deleteParascolaire(Parascolaire parascolaire) async { // Supprime un parascolaire de la base de données
    final db = await _getDB();
    return await db.delete(
      "Parascolaire", // Nom de la table pour les parascolaires
      where: 'id = ?',
      whereArgs: [parascolaire.id],
    );
  }

  static Future<List<Parascolaire>?> getAllParascolaires() async { // Récupère tous les parascolaires depuis la base de données
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Parascolaire"); // Nom de la table pour les parascolaires

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Parascolaire.fromJson(maps[index])); // Convertit les données en objets Parascolaire
  }
}
