// To parse this JSON data, do
//
//     final popularResponse = popularResponseFromMap(jsonString);

import 'dart:convert';

class Movie {
  Movie({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String? releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  String? heroId;
  get fullPosterImg {
    if (this.posterPath != null)
      return 'https://image.tmdb.org/t/p/w500${this.posterPath}';
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  get fullbackdropPath {
    if (this.backdropPath != null)
      return 'https://image.tmdb.org/t/p/w500${this.backdropPath}';
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        // releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  Movie fromJsonWithReplace(Map<String, dynamic> json) {
    return Movie(
      adult: _getbool(json['"adult"']),
      backdropPath: json['"backdrop_path"'].replaceAll('"', ""),
      genreIds: json["genre_ids"].replaceAll('"', ""),
      id: json["id"].replaceAll('"', ""),
      originalLanguage: json["original_language"].replaceAll('"', ""),
      originalTitle: json["original_title"].replaceAll('"', ""),
      overview: json["overview"].replaceAll('"', ""),
      popularity: json["popularity"].toDouble().replaceAll('"', ""),
      posterPath: json["poster_path"].replaceAll('"', ""),
      // releaseDate: json["release_date"],
      title: json["title"].replaceAll('"', ""),
      video: json["video"].replaceAll('"', ""),
      voteAverage: json["vote_average"].toDouble().replaceAll('"', ""),
      voteCount: json["vote_count"].replaceAll('"', ""),
    );
  }

  bool _getbool(String str) {
    if (str == "true") {
      return true;
    }
    return false;
  }
}
