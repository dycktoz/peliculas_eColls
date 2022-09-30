import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/models/models.dart';
import 'package:peliculas_ecolls/sqflite/converts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'movie.db'),
        onCreate: (db, version) {
      db.execute(
        "CREATE TABLE movie (id INTEGER PRIMARY KEY, json TEXT)",
      );
    }, version: 1);
  }

  static Future<int> saveMovie({required String json}) async {
    Database database = await _openDB();

    // debugPrint(json, wrapWidth: 1024);

    final sectionMap = {
      'json': json,
    };

    return database.insert('movie', sectionMap);
  }

  ////////////////////
  // Obtener registros de la seccion 0
  /* Future<List<Movie>> getMovies() async {
    Database database = await _openDB();
    final List<Map> movie = await database.query("movie");

    return List.generate(movie.length, (i) {
      final g = movie[i]['json'];
      print(g);
      Map<String, dynamic> converted = convertSqlToJson(g);
      Movie s0 = Movie().fromJsonWithReplace(converted);
      return s0;
    });
  } */
}
