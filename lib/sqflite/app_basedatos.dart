import 'dart:convert';

import 'package:peliculas_ecolls/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'movie.db'),
        onCreate: (db, version) {
      db.execute(
        "CREATE TABLE movie (id INTEGER PRIMARY KEY, json TEXT)",
      );
      db.execute(
        "CREATE TABLE usuario (id INTEGER PRIMARY KEY, json TEXT)",
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

  static Future<int> saveUsuario({required json}) async {
    Database database = await _openDB();

    Usuario s1 = Usuario().fromJson(json);
    Map<String, dynamic> map = s1.toMap();
    print(map);
    // final jsonString = json.encode(map).toString();

    final sectionMap = {
      'json': json,
    };

    return database.insert('usuario', sectionMap);
  }

  Future<List<MovieSave>> getMovies() async {
    Database database = await _openDB();
    final List<Map> movie = await database.query("movie");

    return List.generate(movie.length, (i) {
      final g = movie[i]['json'];
      final dos = json.decode(g);
      MovieSave s0 = MovieSave().fromJsonWithReplace(dos);
      print(s0);
      return s0;
    });
  }

  Future<List<Usuario>> getUsuario() async {
    Database database = await _openDB();
    final List<Map> movie = await database.query("usuario");

    return List.generate(movie.length, (i) {
      final g = movie[i]['json'];
      final dos = json.decode(g);
      Usuario s0 = Usuario().fromJsonWithReplace(dos);
      print(s0);
      return s0;
    });
  }
}
