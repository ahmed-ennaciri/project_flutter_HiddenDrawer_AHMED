import 'package:project_flutter/models/examens_model.dart'; // Remplace "note_model.dart" par "examen_model.dart"
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Exams.db"; // Remplace "Notes.db" par "Exams.db"

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE Examen(id INTEGER PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL);"), // Remplace "Note" par "Examen"
        version: _version);
  }

  static Future<int> addExamen(Examen examen) async { // Remplace "Note" par "Examen"
    final db = await _getDB();
    return await db.insert("Examen", examen.toJson(), // Remplace "Note" par "Examen"
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateExamen(Examen examen) async { // Remplace "Note" par "Examen"
    final db = await _getDB();
    return await db.update("Examen", examen.toJson(), // Remplace "Note" par "Examen"
        where: 'id = ?',
        whereArgs: [examen.id], // Remplace "note" par "examen"
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteExamen(Examen examen) async { // Remplace "Note" par "Examen"
    final db = await _getDB();
    return await db.delete(
      "Examen", // Remplace "Note" par "Examen"
      where: 'id = ?',
      whereArgs: [examen.id], // Remplace "note" par "examen"
    );
  }

  static Future<List<Examen>?> getAllExams() async { // Remplace "Note" par "Examen"
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Examen"); // Remplace "Note" par "Examen"

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Examen.fromJson(maps[index])); // Remplace "Note" par "Examen"
  }
}
