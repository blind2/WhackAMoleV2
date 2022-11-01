import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:whack_o_mole/models/scoreModel.dart';

class ScoreService {
  Future<Database> init() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path, "score.db"); //create path to database

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      return db.execute(
        'CREATE TABLE score(id INTEGER PRIMARY KEY, date TEXT, nomJoueur TEXT, score INTEGER)',
      );
    });
  }

  Future<int> addScore(ScoreModel score) async {
    final db = await init(); //open database

    return db.insert(
      "Score",
      score.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<ScoreModel>> getScore() async {
    final db = await init();
    final maps = await db.query("Score");

    return List.generate(maps.length, (i) {
      return ScoreModel(
          id: maps[i]['id'] as int,
          date: maps[i]['date'] as String,
          nomJoueur: maps[i]['nomJoueur'] as String,
          score: maps[i]['score'] as int);
    });
  }

  Future<int> deleteScore(int? id) async {
    final db = await init();

    int result = await db.delete("Score",
        where: "id = ?", whereArgs: [id] // whereArgs to avoid SQL injection
        );

    return result;
  }

  Future<int> updateScore(int id, ScoreModel score) async {
    final db = await init();

    int result = await db
        .update("Score", score.toMap(), where: "id = ?", whereArgs: [id]);
    return result;
  }
}
